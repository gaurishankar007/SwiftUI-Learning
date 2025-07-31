import Foundation

/// Equatable
struct Person: Equatable {
    var id: Int
    var name: String
    var age: Int
}

let foo = Person(id: 1, name: "foo", age: 10)
let bar = Person(id: 1, name: "bar", age: 10)

if (foo == bar) {
    "They are equal"
} else {
    "They are not equal"
}

// Custom equality on Person
//extension Person {
//    static func == (
//        lhs: Self,
//        rhs: Self
//    ) -> Bool {
//        lhs.id == rhs.id
//    }
//}

enum AnimalType: Equatable {
    case dog(breed: String)
    case cat(breed: String)
}

// Custom equality on AnimalType
//extension AnimalType: Equatable {
//    static func == (
//        lhs: Self,
//        rhs: Self,
//    ) -> Bool {
//        switch (lhs, rhs) {
//        case let (.dog(lhsBread), .dog(rhsBread)),
//            let (.cat(lhsBread), .cat(rhsBread)):
//            return lhsBread == rhsBread
//        default:
//            return false
//        }
//    }
//}

let dog1 = AnimalType.dog(breed: "Labrador")
let dog2 = AnimalType.dog(breed: "Labrador")

if dog1 == dog2 {
    "They are equal"
} else {
    "They are not equal"
}


struct Animal {
    let name: String
    let type: AnimalType
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.type == rhs.type
    }
}

let cat1 = Animal(name: "Whiskers", type: .cat(breed: "Persian"))
let cat2 = Animal(name: "Socks", type: .cat(breed: "Persian"))

if cat1 == cat2 {
    "They are equal because of their type"
} else {
    "They are not equal"
}

/// Hashable
struct House: Hashable {
    let number: Int
    let numberOFBedRooms: Int
}

let house1 = House(number: 1, numberOFBedRooms: 3)
house1.hashValue

let house2 = House(number: 1, numberOFBedRooms: 4)
house2.hashValue

let houses = Set([house1, house2])
houses.count

// Custom hash value
struct NumberedHouse: Hashable {
    let number: Int
    let numberOfBedRooms: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.number == rhs.number
    }
}

let house3 = NumberedHouse(number: 123, numberOfBedRooms: 3)
let house4 = NumberedHouse(number: 123, numberOfBedRooms: 4)

let houses2 = Set([house3, house4])
houses2.count
// Same hash value accross all of them
house3.hashValue
house4.hashValue
house3.number.hashValue
house4.number.hashValue


// Enum without any associated value is hashable and equatable by default
enum CarPart {
    case roof
    case tire
    case trunk
}
let uniqueParts: Set<CarPart> = [
    .roof,
    .tire,
    .roof,
    .trunk,
]

// Enum with associated value should be hashable to create set out of them
enum HouseType: Hashable {
    case bigHouse(NumberedHouse)
    case smallHouse(NumberedHouse)
}

let bigHouse1 = HouseType.bigHouse(NumberedHouse(number: 123, numberOfBedRooms: 3))
let bigHouse2 = HouseType.bigHouse(NumberedHouse(number: 123, numberOfBedRooms: 3))
let smallHouse1 = HouseType.smallHouse(NumberedHouse(number: 123, numberOfBedRooms: 3))

let allHouses: Set<HouseType> = [
    bigHouse1,
    bigHouse2,
    smallHouse1,
]

for value in allHouses {
    print(value)
}
