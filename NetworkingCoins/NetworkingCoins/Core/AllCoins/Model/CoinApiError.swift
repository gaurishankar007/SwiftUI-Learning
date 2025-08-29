import Foundation

enum CCoinApiError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData:
            return "Invalid data received from the server."
        case .jsonParsingFailure:
            return "Failed to parse JSON data."
        case let .requestFailed(description):
            return "Failed request \(description)."
        case let .invalidStatusCode(statusCode):
            return "Invalid status code \(statusCode)."
        case let .unknownError(error):
            return "An unknown error occurred \(error.localizedDescription)."
        }
    }
}
