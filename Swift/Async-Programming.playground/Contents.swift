import Foundation
import PlaygroundSupport
import _Concurrency

PlaygroundPage.current.needsIndefiniteExecution = true

// Async function that doesn't throw
func calculateFullName(
    firstName: String,
    lastName: String
) async -> String {
    try? await Task.sleep(for: .seconds(1))
    return "\(firstName) \(lastName)"
}

Task {
    let result1 = await calculateFullName(firstName: "Alice", lastName: "Wonderland")
    
    async let result2 = calculateFullName(firstName: "Bob", lastName: "Marley")
    await result2
}

// Async function that throws
enum Clothe {
    case socks, shirt, trousers
}

func buySocks() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return .socks
}

func buyShirt() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return .shirt
}

func buyTrousers() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return .trousers
}

struct Ensemble: CustomDebugStringConvertible {
    let clothes: [Clothe]
    let totalPrice: Double
    
    var debugDescription: String {
        "Clothes = \(clothes), totalPrice = \(totalPrice)"
    }
}

func buyWholeEnsemble() async throws -> Ensemble {
    async let socks = buySocks()
    async let shirt = buyShirt()
    async let trousers = buyTrousers()
    
    let ensemble = Ensemble(
        clothes: await [
            try socks,
            try shirt,
            try trousers
        ],
        totalPrice: 100.0
    )
    return ensemble
}

Task {
    if let ensemble = try? await buyWholeEnsemble() {
        ensemble
    } else {
        "Something went wrong"
    }
}

func getFullName(
    delay: Duration,
    calculator: @Sendable @escaping () async -> String
) async -> String {
    try? await Task.sleep(for: delay)
    return await calculator()
}

func fullName() async -> String {
    "Alice Wonderland"
}

Task {
    await getFullName(
        delay: .seconds(1)
    ) {
        async let name = fullName()
        return await name
    }
}
