import SwiftUI
import CreditCardScanner

struct CreditCardScannerView: UIViewControllerRepresentable {
    @Binding var isModalOpen: Bool
    @Binding var cards: [Card]
    let onScan: () -> Void
    
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
        Coordinator(isModalOpen: $isModalOpen, cards: $cards, onScan: onScan)
    }
    
    class Coordinator: NSObject, CreditCardScannerViewControllerDelegate {
        internal init(isModalOpen: Binding<Bool>, cards: Binding<[Card]>, onScan: @escaping () -> Void) {
            self._isModalOpen = isModalOpen
            self._cards = cards
            self.onScan = onScan
        }
        
        @Binding var isModalOpen: Bool
        @Binding var cards: [Card]
        let onScan: () -> Void
        
        func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didErrorWith error: CreditCardScannerError) {
            viewController.dismiss(animated: true)
            print(error.errorDescription ?? "Unknown error")
            onScan()
        }
        
        func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didFinishWith card: CreditCard) {
            // Do something with credit card info
            print("\(card)")
            onScan()
            // Só testando se está funcionando
            cards.append(Card(name: card.name ?? "Teste", cardNumber: card.number ?? "1232 1212 9999 7722", cardImage: "CardNU"))
            isModalOpen = false
            
            
        }
        
        func creditCardScannerViewControllerDidCancel(_ viewController: CreditCardScannerViewController) {
            viewController.dismiss(animated: true)
            // Handle cancel event if needed
        }
    }
}

struct ScannerView: View {
    @Binding var isModalOpen: Bool
    @Binding var cards: [Card]
    
    @State var shouldNavigateToNextView: Bool = false
    
    var body: some View {
        ZStack {
            CreditCardScannerView(isModalOpen: $isModalOpen, cards: $cards) {
                shouldNavigateToNextView = true
            }
            VStack{
                NavigationLink(destination: Register_Card_ModalView(isModalOpen: $isModalOpen, cards: $cards)){
                    Text("Enter Card Details Manually")
                }
                .padding(.top, 600)
                .foregroundColor(Color.blue)
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScannerView()
//    }
//}

