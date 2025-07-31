import Foundation

enum Animals {
    case cat
    case dog
    case rabbit
    case hedgeHog
}

let cat = Animals.cat

if cat == Animals.cat {
    "This is a cat"
} else if cat == Animals.dog {
    "This is a dog"
} else {
    "This is something else"
}

switch cat {
case .cat:
    "This is a cat"
    break
case .dog:
    "This is a dog"
    break
case .rabbit:
    "This is a rabbit"
case .hedgeHog:
    "This is a hedgeHog"
}

/// Enumerations with associated values
enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(
    path: URL(string: "https://apple.com")!
)

switch wwwApple {
case .fileOrFolder(
    path: let path,
    name: let name
):
    path
    name
    break
case .wwwUrl(path: let path):
    path
    break
case .song(
    artist: let artist,
    songName: let songName
):
    artist
    songName
    break
}

/// Enumeration switch cases without the external arguments
switch wwwApple {
case .fileOrFolder(
    let path,
    let name
):
    path
    name
    break
case .wwwUrl(let path):
    path
    break
case .song(
    let artist,
    let songName
):
    artist
    songName
    break
}

/// Removing 'let' from each associated values
switch wwwApple {
case let .fileOrFolder(
    path,
    name
):
    path
    name
    break
case let .wwwUrl(path):
    path
    break
case let .song(
    artist,
    songName
):
    artist
    songName
    break
}

if case let .wwwUrl(path) = wwwApple {
    path
}

let withoutYou = Shortcut.song(
    artist: "The Beatles",
    songName: "Without You"
)

if case let .song(_, songName) = withoutYou {
    "The song name is \(songName)"
}

/// Enumeration with mehtod and computed value
enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    
    func getManufacturer() -> String {
        switch self {
        case let .car(manufacturer, _):
            return manufacturer
        case let .bike(manufacturer, _):
            return manufacturer
        }
    }
    
    var manufacturer: String {
        switch self {
        case let .car(manufacturer, _),
        let .bike(manufacturer, _):
            return manufacturer
        }
    }
}

let car = Vehicle.car(
    manufacturer: "Tesla",
    model: "X"
)
let bike = Vehicle.bike(
    manufacturer: "Trek",
    yearMade: 2019
)

switch car {
case let .car(manufacturer, _):
    manufacturer
    break
case let .bike(manufacturer, _):
    manufacturer
    break
}
car.getManufacturer()
bike.manufacturer

/// Enumeration with default value
enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.father.rawValue
FamilyMember.brother.rawValue

enum FavoriteEmoji: String, CaseIterable {
    case blush = "😊"
    case rocker = "🚀"
    case fire = "🔥"
}

FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)

if let blush = FavoriteEmoji(rawValue: "😊") {
    "Found blush emoji"
    blush
} else {
    "This emoji doesn't exist"
}

if let snow = FavoriteEmoji(rawValue: "❄️") {
    "Found blush emoji"
    snow
} else {
    "This emoji doesn't exist"
}

/// Mutating Enumerations
enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}
var myHeight = Height.medium
myHeight.makeLong()
myHeight

/// Recursive Enumerations
indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freeHand(IntOperation)
    
    func calculateResult(
        of operation: IntOperation? = nil
    ) -> Int {
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .subtract(lhs, rhs):
            return lhs - rhs
        case let .freeHand(operation):
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freeHand(.add(2, 3))
freeHand.calculateResult()
