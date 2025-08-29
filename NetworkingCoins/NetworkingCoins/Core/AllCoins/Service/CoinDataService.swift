import Foundation

class CoinDataService {
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=25&page=1&sparkline=false&price_change_percentage=24h&locale=en"
    
    func fetchCoins() async -> Result<[Coin], CCoinApiError> {
        guard let url = URL(string: urlString) else {
            return .failure(.requestFailed(description: "Invalid URL"))
        }
    
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let coins = try JSONDecoder().decode([Coin].self, from: data)
            return .success(coins)
        } catch {
            return .failure(.unknownError(error: error))
        }
    }
    
}

// MARK: - Completion Handler
extension CoinDataService {
    func fetchCoinsWithResult(completion: @escaping(Result<[Coin], CCoinApiError>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "No HTTP response")))
                return
            }
            guard response.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: response.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                completion(.success(coins))
            } catch {
                completion(.failure(.jsonParsingFailure))
            }
        }
        .resume()
    }
    
    func fetchCoinPrice(coin: String, completion: @escaping (Double) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: Failed with error \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Bad HTTP Response")
                return
            }
            
            guard response.statusCode == 200 else {
                print("Failed to fetch with status code \(response.statusCode)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                let value = jsonObject?[coin] as? [String: Any]
                let price = value?["usd"] as? Double ?? 0
                completion(price)
            } catch {
                print("Failed to parse JSON: \(error)")
            }
        }
        .resume()
    }
}
