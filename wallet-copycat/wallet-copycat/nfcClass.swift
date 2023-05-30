//
//  NFC_class.swift
//  IOS-Wallet-Copycat
//
//  Created by Caio Gomes Piteli on 23/05/23.
//

import Foundation
import CoreNFC
import UserNotifications

//Class that contains NFC funcionalities
class NFCReader: NSObject, ObservableObject, NFCNDEFReaderSessionDelegate{
    
    //Session to read NFC Tags (Closes in 60 seconds)
    var nfcSession: NFCNDEFReaderSession?
    
    
    //Action that is called when the card screen is open
    func scanTag(){
        
        nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        
        nfcSession?.alertMessage = "Put the NFC tag close to the phone" //Alert message everytime I open my session to read NFC
        
        nfcSession?.begin()
        
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {   }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {   }
    
    //This is the function that tells what the session is intend to do
    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
        
        if tags.count > 1{
            let retryInterval = DispatchTimeInterval.milliseconds(500)
            session.alertMessage = "More than 1 tag found, try again"
            DispatchQueue.global().asyncAfter(deadline: .now() + retryInterval, execute: {
                session.restartPolling()
            })
            return
        }
        
        //when tag detected
        let tag = tags.first!
        
        session.connect(to: tag, completionHandler: {(error: Error?) in
            
            if nil != error{
                session.alertMessage = "ERROR, couldn't read the TAG"
                session.invalidate()
                return
            }
            
            tag.queryNDEFStatus(completionHandler: {(ndefstatus: NFCNDEFStatus, capacity: Int, error: Error?) in
                guard error == nil else{
                    session.alertMessage = "ERROR, couldn't read the TAG"
                    session.invalidate()
                    return
                }
                
                switch ndefstatus{
                    
                case .notSupported:
                    session.alertMessage = "TAG isn't supported"
                    session.invalidate()
                
                ///Gerar notificacao e descontar saldo aqui
                case .readOnly:
                    session.alertMessage = "Read only TAG"
                    requestAuthorization()
                    sendNotification()
                    session.invalidate()
                    
                ///Gerar notificacao e descontar saldo aqui
                case .readWrite:
                    session.alertMessage = "Read and write TAG"
                    requestAuthorization()
                    sendNotification()
                    session.invalidate()
                    
                default:
                    session.alertMessage = "ERROR, something strange happend"
                    session.invalidate()
                }
            })
            
        })
        
    }
    
}

