import Foundation

func multiplyByTwo(_ value: Int? = nil) -> Int? {
    if let value = value {
        return value * 2
    } else {
        return nil
    }
}

multiplyByTwo()
multiplyByTwo(nil)
multiplyByTwo(4)
multiplyByTwo(10)

/// Optional checking with if statement
let age: Int? = nil
if age != nil {
    "Age is there! How odd!"
} else {
    "Age is nil. Correct."
}

if let age {
    "Age is there. How odd! Its value is \(age)"
} else {
    "No age is present. As expected"
}

/// Optional checking with guard (guard must be returned in case of else)
func checkAge() {
    guard age != nil else {
        "Age is nil as expected"
        return
    }
    "Age is not nil here. Strange!"
}
checkAge()

let age2: Int? = 0
func checkAge2() {
    guard let age2 else {
        "Age is nil. How strange"
        return
    }
    "Age2 is not nil as expected. Value = \(age2)"
}
checkAge2()

/// Switch statement in optional
switch age {
case .some(let value):
    "Age is \(value)"
    break
case .none:
    "Age is nil"
    break
}

/// Optional comparision
if age2 == 0 {
    "Age is 0 as exptected, and is not nil"
} else {
    "Age is not 0. How Strange!"
}

if age2 == .some(0) {
    "Age is 0 as exptected, and is not nil"
} else {
    "Age is not 0. How Strange!"
}

/// Optional chain
struct Person {
    let name: String
    let address: Address?
    
    struct Address {
        let firstLine: String?
    }
}

let foo: Person = Person(
    name: "Foo",
    address: nil
)
if let fooFirstAddressLine = foo.address?.firstLine {
    fooFirstAddressLine
} else {
    "Foo doesn't have an address with a first line as expected"
}

if let fooAdress = foo.address,
    let firstLine = fooAdress.firstLine {
    fooAdress
    firstLine
}

let bar: Person?  = Person(
    name: "Bar",
    address: Person.Address(
        firstLine: nil
    )
)

if bar?.name == "Bar",
   bar?.address?.firstLine == nil {
    "Bar's name is bar and has no first line of address"
} else  {
    "Seems like something isn't working right!"
}

let baz: Person?  = Person(
    name: "Baz",
    address: Person.Address(
        firstLine: "Baz first line"
    )
)

switch baz?.address?.firstLine {
case let .some(firstLine) where firstLine.starts(with: "Baz"):
    "Baz first address line = \(firstLine)"
case let .some(firstLine):
    "Baz first address line that didn't match the previous case"
case .none:
    "Baz first address line is nil?? Weird!"
}

func getFullName (
    firstName: String,
    lastName: String?
) -> String? {
    if let lastName {
        return "\(firstName) \(lastName)"
    } else {
        return nil
    }
}

getFullName(firstName: "Jane", lastName: nil)
getFullName(firstName: "John", lastName: "Doe")


func getFullName2 (
    firstName: String,
    lastName: String?
) -> String? {
    guard let lastName else {
        return nil
    }
    return "\(firstName) \(lastName)"
}

getFullName2(firstName: "Jane", lastName: nil)
getFullName2(firstName: "John", lastName: "Doe")
