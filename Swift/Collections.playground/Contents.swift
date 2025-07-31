import Foundation

/// Arrays (Lists)
let numbers = [1, 2, 3, 4, 5]
numbers.first
numbers.last
numbers.count
numbers.map(-) // - is operation

var mutatingNumbers = [4, 5, 6]
mutatingNumbers.append(7)
mutatingNumbers.insert(3, at: 0)
mutatingNumbers.insert(contentsOf: [1, 2], at: 0)

for value in numbers {
    value
}

for value in numbers where value % 2 == 0 {
    value
}

numbers.map { (value: Int) -> Int in
    value * 2
}

numbers.filter { (value: Int) -> Bool in
    value % 2 == 0
}
// Combination of map and filter with return type of even different data type
numbers.compactMap { (value: Int) -> String? in
    value >= 3
    ? String(value)
    : nil
}

let numbers2: [Int?] = [1, 2, nil, 4, 5]
numbers2.count
let notNils = numbers2.filter { (value: Int?) -> Bool in
    value != nil
}

let numbers3 = [1, 2, 1, 2]
numbers3.count

let stuff1 = [1, "Hello", 2, "World"] as [Any]
stuff1.count

let intsInStuff1 = stuff1.compactMap { (value: Any) -> Int? in
    value as? Int
}

let stringsInStuff1 = stuff1.compactMap { (value: Any) -> String? in
    value as? String
}

let stuff2: [Any] = ["Hello", 2, "World", 1]
stuff2.count

/// Sets, set only contains unique elements
let uniqueNumbers = Set([1, 2, 1, 3, 4, 4, 5])
uniqueNumbers.count
uniqueNumbers.map(-)

let myNumbers = Set([1, 2, 3, nil, 5])
let notNilNumbers = Set(
    myNumbers.compactMap {
        $0
    }
)
notNilNumbers

let stuff3: Set<AnyHashable> = [
    1, 2, 3, "Vandad"
]
stuff3.count

let intsInStuff3 = stuff3.compactMap { (value: AnyHashable) -> Int? in
    value as? Int
}

// Sets with hash elements
// Set doesn't contain all the elements having same hash value, only the one of them will be kept
struct Person: Hashable {
    let id: UUID
    let name: String
    let age: Int
}

let fooId = UUID()
let foo = Person(id: fooId, name: "Foo", age: 30)
let bar = Person(id: fooId, name: "Bar", age: 30)

let people: Set<Person> = [foo, bar]
people.count

struct Person2: Hashable {
    let id: UUID
    let name: String
    let age: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (
        lhs: Person2,
        rhs: Person2
    ) -> Bool {
        lhs.id == rhs.id
    }
}


let bazId = UUID()
let baz = Person2(id: bazId, name: "Baz", age: 30)
let qux = Person2(id: bazId, name: "Qux", age: 30)

let people2 = Set([baz, qux])
people2.count

/// Dictionaries
let userInfo = [
    "name": "Foo",
    "age": 20,
    "address": [
        "line1": "Address line 1",
        "postCode": "12345"
    ]
] as [String: Any]

userInfo["name"]
userInfo["age"]
userInfo["address"]
userInfo["name"]

// Don't do this in production code
(userInfo["address"] as! [String: String])["postCode"]

userInfo.keys
userInfo.values

for (key, value) in userInfo {
    key
    value
}

for (key, value) in userInfo where value is Int {
    key
    value
}

for (key, value) in userInfo where value is Int && key.count > 2 {
    key
    value
}

