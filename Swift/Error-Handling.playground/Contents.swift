import Foundation

struct Person {
    let firstName: String?
    let lastName: String?
    
    enum Errors: Error {
        case firstNameNil
        case lastNameNil
        case fullNameNil
    }
    
    func getFullName() throws -> String {
        switch (firstName, lastName) {
        case (.none, .none):
            throw Errors.fullNameNil
        case (.none, .some):
            throw Errors.fullNameNil
        case (.some, .none):
            throw Errors.lastNameNil
        case let (.some(firstName), .some(lastName)):
            return "\(firstName) \(lastName)"
        }
    }
}

let foo = Person(firstName: "John", lastName: nil)

// Error catching with do-catch
do {
    let fullName = try foo.getFullName()
} catch {
    "Got an error \(error)"
}

// Catching specific type of error
do {
    let fullName = try foo.getFullName()
} catch is Person.Errors {
    "Got a person error"
}

let bar = Person(firstName: nil, lastName: nil)

// Catching specific error
do {
    let fullName = try foo.getFullName()
} catch Person.Errors.firstNameNil {
    "First name is nil"
} catch Person.Errors.lastNameNil {
    "Last name is nil"
} catch Person.Errors.fullNameNil {
    "Both names are nil"
} catch {
    "Some other error was thrown"
}

// Constructor which throws error
struct Car {
    let manufacturer: String
    
    enum Errors: Error {
        case invalidManufacturer
    }
    
    init(manufacturer: String) throws {
        if manufacturer.isEmpty {
            throw Errors.invalidManufacturer
        }
        self.manufacturer = manufacturer
    }
}

do {
    let myCar = try Car(manufacturer: "")
    myCar
    myCar.manufacturer
} catch Car.Errors.invalidManufacturer {
    "Invalid manufacturer"
} catch {
    "Some other error"
}

// Optionally trying to call a function that throws and grabs it's value
if let yourCar = try? Car(manufacturer: "Tesla") {
    "Success, your car = \(yourCar)"
} else {
    "Failed to construct and error is not accessible now"
}

// Don't do this in production code, otherwise the app may crash because manufacturer can be empty and it will throw error
let theirCar = try! Car(manufacturer: "Toyota")
theirCar.manufacturer

// Throwing function doesn't need do-catch for errors and it can throw any errors
struct Dog {
    let isInjured: Bool
    let isSleeping: Bool
    
    enum BarkingErrors: Error {
        case cannotBarkIsSleeping
    }
    
    enum RunningErrors: Error {
        case cannotRunIsInjured
    }
    
    func bark() throws {
        if isSleeping {
            BarkingErrors.cannotBarkIsSleeping
        }
        "Bark..."
    }
    
    func run() throws {
        if isInjured {
            throw RunningErrors.cannotRunIsInjured
        }
        "Run..."
    }
    
    func barkAndRun() throws {
        try bark()
        try run()
    }
}

let dog = Dog(isInjured: true, isSleeping: true)

do {
    try dog.barkAndRun()
} catch Dog.BarkingErrors.cannotBarkIsSleeping,
        Dog.RunningErrors.cannotRunIsInjured {
    "Cannot-bark-is-sleeping OR cannot-run-is-injured"
} catch {
    "Some other error"
}

// Re-throws, a fucntion should have a throwing function as argument in order to rethrows
func fullName(
    firstName: String?,
    lastName: String?,
    calculator: (String?, String?) throws -> String?
) rethrows -> String? {
    try calculator(firstName, lastName)
}


enum NameErrors: Error {
    case firstNameIsInvalid
    case lastNameIsInvalid
}

func + (
    firstName: String?,
    lastName: String?
) throws -> String {
    guard let firstName, !firstName.isEmpty else {
        throw NameErrors.firstNameIsInvalid
    }
    guard let lastName, !lastName.isEmpty else {
        throw NameErrors.lastNameIsInvalid
    }
    
    return "\(firstName) \(lastName)"
}

do {
    let fooBar = try fullName (
        firstName: nil,
        lastName: nil,
        calculator: +
    )
} catch NameErrors.firstNameIsInvalid {
    "First name is invalid"
} catch NameErrors.lastNameIsInvalid {
    "Last name is invalid"
} catch let err {
    "Some other error = \(err)"
}

// Return specific type of error
enum IntegerErrors: Error {
    case noPositiveIntegerBefor(thisValue: Int)
}

// Returns previous positive integer
func getPreviousPositiveInteger(
    from int: Int
) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return .failure(
            .noPositiveIntegerBefor (
                thisValue: int
            )
        )
    }
    
    return .success(int - 1)
}

func performGet(forValue value: Int) {
    switch getPreviousPositiveInteger(from: value) {
    case let .success(previouseValue):
        "Previous value is \(previouseValue)"
    case let .failure(error):
        switch error {
        case let .noPositiveIntegerBefor(thisValue):
            "No positive integer before \(thisValue)"
        }
    }
}

performGet(forValue: 0)
performGet(forValue: 6)
