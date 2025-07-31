import Foundation

extension Int {
    func plusTwo() -> Int {
        return self + 2
    }
}
let number = 10
number.plusTwo()

/// Extensions with initializer
struct Person {
    let firstName: String
    let lastName: String
}

extension Person {
    init (fullName: String) {
        let components = fullName.components(separatedBy: " ")
        self.init(
            firstName: components.first ?? fullName,
            lastName: components.last ?? fullName,
        )
    }
}

let person = Person(fullName: "John Doe")
person.firstName
person.lastName


/// Extension on existing type
protocol GoesVroom {
    var vroomValue: String { get }
    func goVroom() -> String
}

extension GoesVroom {
    func goVroom() -> String {
        "\(self.vroomValue) goes voom!"
    }
}

struct Car {
    let manufactuer: String
    let model: String
}

let modelX = Car(manufactuer: "Tesla", model: "X")

extension Car: GoesVroom {
    var vroomValue: String {
        "\(self.manufactuer) model \(self.model)"
    }
}
modelX.goVroom()

/// Extension on classes with convinience initializer
class MyDouble {
    let value: Double
    init(value: Double) {
        self.value = value
    }
}

extension MyDouble {
    convenience init() {
        self.init(value: 0)
    }
}

let myDouble = MyDouble()
myDouble.value


/// Extensions on existing protocols
extension GoesVroom {
    func goVroomVroomEvenMore() -> String {
        "\(self.vroomValue) is vrooming even more!"
    }
}
modelX.goVroomVroomEvenMore()
