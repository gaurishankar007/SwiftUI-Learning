import Foundation

// Marking this function as @MainActor ensures all its code
// that sets @Published properties runs on the main thread.
@MainActor
class CoinsViewModel: ObservableObject {
    private let service: CoinDataService
    @Published var coins: [Coin] = []
    @Published var errorMessage: String?

    init(service: CoinDataService) {
        self.service = service
        fetchCoins()
    }
    
    func fetchCoins() {
        Task {
            let result = await service.fetchCoins()
            
            switch result {
            case let .success(coins):
                // Because the function is @MainActor, this resume point is
                // guaranteed to be on the main thread. Safe to update UI.
                self.coins = coins
            case let .failure(error):
                self.errorMessage = error.customDescription
            }
            
            // If you remove the @MainActor from the ObservableObject
            // UI can be updated like this
//            await MainActor.run {
//                switch result {
//                case let .success(coins):
//                    self.coins = coins
//                case let .failure(error):
//                    self.errorMessage = error.customDescription
//                }
//            }
        }
    }
    
    func fetchCoinsWithCompletionHandler() {
        // Fetching coins with completion handler
        // Making weak reference of this class to the completion handler
        // so that this class can be disposed without any issues
        // because the completion handler could live longer than this class.
        // This is a retain Cycle.
        service.fetchCoinsWithResult { [weak self] (result: Result) in
            DispatchQueue.main.async {
               switch result {
               case let .success(coins):
                   self?.coins = coins
               case let .failure(error):
                   self?.errorMessage = error.customDescription
               }
            }
        }
    }
}
