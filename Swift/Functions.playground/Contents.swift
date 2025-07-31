import Foundation

func noArgumentsAndNoReturnValue() {
    "I don't know what to do here"
}
noArgumentsAndNoReturnValue()

// Function with argument name and no return type
func plusTwo(value: Int) {
    let newValue = value + 2
}
plusTwo(value: 10)

// Function with argument name and return type
// If you don't specify the retun type then the funcion should have only one line of operation
func newPlusTwo(value: Int) -> Int {
//    return value + 2
// OR
    value + 2
}
newPlusTwo(value: 45)

func customAdd(
    value1: Int,
    value2: Int,
) -> Int {
    value1 + value2
}
let customAdded = customAdd(value1: 10, value2: 20)

// Function with no-arguments name
func customSubstract(
   _ lhs: Int,
   _ rhs: Int,
) -> Int {
    lhs - rhs
}
let customSubstracted = customSubstract(20, 15)


// Function that produces value however the callside doesn't necessarily have to consume the value
// Inside a swift file, you will get warning like the function call is unused if the function call value is not assiged or consumed
// But this warning does not appear in playground
@discardableResult
func myCustomAdd(
    _ lhs: Int,
    _ rhs: Int,
 ) -> Int {
     lhs + rhs
}
myCustomAdd(5, 15)


// Function within another function where 'with' is external and 'value' is internal argument name
func doSomethingComplicated(with value: Int) -> Int {
    func mainLogic(value: Int) -> Int {
        value + 2
    }
    return mainLogic(value: value + 3)
}
doSomethingComplicated(with: 10)

// Function with default value argument
func getFullName(
    firstName: String = "John",
    lastName: String = "Doe",
) -> String {
    "\(firstName) \(lastName)"
}
getFullName()
getFullName(firstName: "Baz")
getFullName(lastName: "Foo")
getFullName(firstName: "Baz", lastName: "Qux")
