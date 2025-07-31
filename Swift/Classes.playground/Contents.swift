import Foundation

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func increaseAge() {
        self.age += 1
    }
}

let foo = Person(name: "foo", age: 10)
foo.age
foo.increaseAge()
foo.age
foo.age += 10
foo.age

let bar = foo
bar.age
bar.increaseAge()
bar.age
foo.age


if foo === bar {
    "foo and bar are the same object, and point to the same memory location"
} else {
   "foo and bar are different objects"
}

/// Inheritance
class Vehicle {
    func goVroom() -> String {
        "Vroom vroom"
    }
}

class Car: Vehicle {
    
}

let car = Car()
car.goVroom()


/// Encapsulation
class Person2 {
    private(set) var age: Int
    init(age: Int) {
        self.age = age
    }
    
    func increseAge() {
        self.age += 1
    }
}
let baz = Person2(age: 10)
baz.age
// baz.age += 10
baz.increseAge()
baz.age


class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    
    init() {
        self.model = "X"
        self.year = 2025
    }
    
    // Designated Initializer
    init(model: String, year: Int) {
        self.model = model
        self.year = year
    }
    
    convenience init(
        model: String
    ) {
        self.init(
            model: model,
            year: 2025
        )
    }
}

class TeslaModelX: Tesla {
    override init() {
        super.init(
            model: "X",
            year: 2025
        )
    }
}

let modelX = TeslaModelX()
modelX.model
modelX.year
modelX.manufacturer


let fooBar = Person2(age: 20)
fooBar.age
func doSomething(with person: Person2) {
    person.increseAge()
}
doSomething(with: fooBar)
fooBar.age


/// Deinitializer in class is automatically invoked when the instance is reomve from the memory
class MyClass {
    init() {
        "Initialized"
    }
    
    func doSomething() {
         "Do something"
    }
    
    deinit {
        "Deinitialized"
    }
}

let myCloser = {
    let myClass = MyClass()
    myClass.doSomething()
}
myCloser()

