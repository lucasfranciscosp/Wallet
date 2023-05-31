import SwiftUI
import CreditCardScanner

struct CreditCardScannerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CreditCardScannerViewController {
        let viewController = CreditCardScannerViewController(delegate: context.coordinator)
        viewController.subtitleLabelText = "Position your debit or credit card in the frame to scan it."
        viewController.cancelButtonTitleText = ""
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: CreditCardScannerViewController, context: Context) {
        // No need to update anything
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, CreditCardScannerViewControllerDelegate {
        func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didErrorWith error: CreditCardScannerError) {
            viewController.dismiss(animated: true)
            print(error.errorDescription ?? "Unknown error")
        }
        
        func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didFinishWith card: CreditCard) {
            // Do something with credit card info
            print("\(card)")
        }
        
        func creditCardScannerViewControllerDidCancel(_ viewController: CreditCardScannerViewController) {
            viewController.dismiss(animated: true)
            // Handle cancel event if needed
        }
    }
}

struct ScannerView: View {
    var body: some View {
        ZStack {
            CreditCardScannerView()
            VStack{
                Button("Enter Card Details Manually"){
                    
                }
                .padding(.top, 700)
                .foregroundColor(Color.blue)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}

