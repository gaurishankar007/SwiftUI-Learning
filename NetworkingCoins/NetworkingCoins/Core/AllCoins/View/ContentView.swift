import SwiftUI

struct ContentView: View {
    // 1. Access the service from the Environment
    @Environment(\.coinDataService) private var coinDataService
    // 2. Create the StateObject using the service from the environment
    @StateObject private var viewModel: CoinsViewModel
    // 3. Create a custom initializer for your View
    // This is necessary because we need the environment to be set up before creating the ViewModel.
    init() {
      // We can't access @Environment in the initializer, so we'll create the ViewModel in .onAppear.
      // We'll temporarily initialize it with a placeholder, but it will be replaced immediately.
      _viewModel = StateObject(wrappedValue: CoinsViewModel(service: CoinDataService()))
    }
    
    var body: some View {
        List(viewModel.coins) { coin in
            HStack(spacing: 12) {
                Text("\(coin.marketCapRank)")
                    .foregroundColor(.gray)
                
                // Show network image
                AsyncImage(url: URL(string: coin.image.replacingOccurrences(of: "large", with: "small"))) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 32, height: 32)
                    case let .success(image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    case .failure:
                        Image(systemName: "photo")
                            .frame(width: 32, height: 32)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(coin.name)
                        .fontWeight(.semibold)
                    Text(coin.symbol.uppercased())
                        .font(.caption)
                        .fontWeight(.light)
                }
            }
            .font(.footnote)
        }
        .overlay {
            if let error = viewModel.errorMessage {
                Text(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
