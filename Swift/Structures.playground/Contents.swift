import Foundation

/// Structures in Swift are value types meaning assigning an instance of any structrue to another variable
/// means the internal data of that structure will be copied over to that variable.

struct Pseron {
    let name: String
    let age: Int
}

let foo = Pseron(name: "Foo", age: 20)
foo.name
foo.age

/// Struct with defualt property
struct CommodoreComputer {
    let name: String
    let menuFacturer: String = "Apple"
// OR
//    init(name: String) {
//        self.name = name
//        self.menuFacturer = "Apple"
//    }
}

let c64 = CommodoreComputer(
    name: "Commodore 64",
)
c64.name
c64.menuFacturer

/// Struct with computed property
struct Person2 {
    let firstName: String
    let lastName: String
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
let fooBar = Person2(
    firstName: "Foo",
    lastName: "Bar"
)
fooBar.firstName
fooBar.fullName
fooBar.lastName

/// Structure with mutable properties
struct Car {
    var currentSpeed: Int
    mutating func drive(speed: Int) {
        "Driving...."
        currentSpeed = speed
    }
}
// 'let' will not allow to change the 'currentSpeed'
let immutableCar = Car(currentSpeed: 20)
// immutableCar.drive(speed: 40)

// 'var' will allow to change the 'currentSpeed'
var mutableCar = Car(currentSpeed: 20)
mutableCar.drive(speed: 40)
mutableCar.currentSpeed

// Structure is being copied to a new variable
let copyOfMutableCar = mutableCar
mutableCar.currentSpeed
mutableCar.drive(speed: 30)
mutableCar.currentSpeed
copyOfMutableCar.currentSpeed

// Copying a structure with different property value
struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    func copy(currentSpeed: Int) -> Bike {
        Bike(
            manufacturer: self.manufacturer,
            currentSpeed: currentSpeed
        )
    }
}
let bike1 = Bike(manufacturer: "Honda", currentSpeed: 10)
let bike2 = bike1.copy(currentSpeed: 20)
bike1.currentSpeed
bike2.currentSpeed
