//
//  Notification.swift
//  wallet-copycat
//
//  Created by Caio Gomes Piteli on 30/05/23.
//

import Foundation
import UserNotifications

func requestAuthorization(){
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        if success{
            print("Permission granted")
        }else if let error = error{
            print(error.localizedDescription)
        }
    }
}

func sendNotification(){
    
    let content = UNMutableNotificationContent()
    content.title = "Payment detected"
    content.body = "340,80 R$ payment on eldoradoLojinha**"
        .lowercased()
    content.sound = UNNotificationSound.default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request)
}
