import Foundation

/// Protocols are kind of mixin available in dart language

protocol CanBreathe {
    func breathe()
}

struct Animal: CanBreathe {
    func breathe() {
        print("Animal is breathing")
    }
}

struct Person: CanBreathe {
    func breathe() {
        print("Person is breathing")
    }
}

let dog = Animal()
dog.breathe()
let foo = Person()
foo.breathe()


/// Protocol with body with extension
protocol canJump {
    func jump()
}

extension canJump {
    func jump() {
        print("I can jump")
    }
}

struct Cat: canJump {
    
}

let whiskers = Cat()
whiskers.jump()

/// Protocol with variables
protocol HasName {
    var name: String { get }
    var age: Int { get set }
    mutating func increaseAge()
}

struct Dog: HasName {
    let name: String
    var age: Int
}

extension HasName {
    func describeMe() -> String {
        "Your name is \(name) and you are \(age) years old."
    }
    
    mutating func increaseAge() {
        self.age += 1
    }
}

var woof = Dog(name: "woof", age: 10)
woof.name
woof.age
woof.age += 1
woof.age
woof.describeMe()
woof.increaseAge()
woof.age

/// Protocols with mutating function
protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
    mutating func increaseSpeed(by value: Int) {
        self.speed += value
    }
}

struct Bike: Vehicle {
    var speed: Int
    
    init() {
        self.speed = 0
    }
}

var bike  = Bike()
bike.speed
bike.increaseSpeed(by: 10)
bike.speed


/// Check protocol type
func describe(obj: Any) {
    if obj is Vehicle {
        "obj conforms to Vehicle protocol"
    } else  {
        "obj deos NOT conform to the Vehicle protocol"
    }
}
describe(obj: bike)

func increaseSpeedIfVehicle(obj: Any) {
    if var vehicle = obj as? Vehicle {
        vehicle.speed
        vehicle.increaseSpeed(by: 100)
        vehicle.speed
    } else {
        "This is not a vehicle"
    }
}
increaseSpeedIfVehicle(obj: bike)
