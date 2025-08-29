import SwiftUI

@main
struct NetworkingCoinsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.coinDataService, CoinDataService())
        }
    }
}

extension EnvironmentValues {
  @Entry var coinDataService: CoinDataService = CoinDataService()
}
