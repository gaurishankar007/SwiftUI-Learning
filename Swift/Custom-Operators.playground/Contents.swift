import Foundation

// Unary prefix operator
prefix operator ^
prefix func ^ (value: String) -> String {
    value.uppercased()
}

let lowercasedName = "JOHN"
let upperCasedName = ^lowercasedName


// Unary postfix operator
postfix operator * // Declaration
postfix func * (value: String) -> String { // Implementation
    "*** \(value) ***"
}

let withStars = lowercasedName*

// Binary infix operator with same type
func + (
    lhs: String?,
    rhs: String?
) -> String? {
    switch (lhs, rhs) {
    case let (.some(lhs), .some(rh)):
        return lhs + rhs
    case let (.some(value), .none),
        let (.none, .some(value)):
        return value
    case (.none, .none):
        return nil
    }
}

let firstName: String? = "John"
let lastName: String? = "Doe"
let fullName: String? = firstName + " " + lastName


// Binary infix operator with unrelated types
struct Person {
    let name: String
}

struct Family {
    let members: [Person]
}

func + (
    lhs: Person,
    rhs: Person
) -> Family {
    Family(members: [lhs, rhs])
}

func + (
    lhs: Family,
    rhs: Person
) -> Family {
    var members = lhs.members
    members.append(rhs)
    return Family(members: members)
}

func + (
    lhs: Family,
    rhs: [Person]
) -> Family {
    var members = lhs.members
    members.append(contentsOf: rhs)
    return Family(members: members)
}

let mom = Person(name: "Mom")
let dad = Person(name: "Dad")
let son = Person(name: "Son")
let daughter1 = Person(name: "Daughter1")
let daughter2 = Person(name: "Daughter2")

let family = mom + dad
family.members.count

let familyWithSon = family + son
familyWithSon.members.count

let familyWithDaughter = familyWithSon + [
    daughter1,
    daughter2
]
family.members.count
