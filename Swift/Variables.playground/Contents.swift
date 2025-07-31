import Foundation

// 'let' can not be re-assinged.
let myName: String = "John Doe"
let yourName: String = "Foo"

// 'var' can be re-assigned again
var names: [String] = [myName, yourName]
names.append("Bar")
names.append("Baz")


// 'moreName' varialble value is structure and structure are value type
// 'moreName' value can not be modified internally either because it's value is value type
let moreName = ["Foo", "Bar"]
var copy = moreName
copy.append("Baz")


// 'oldArray' variable value is class and class are reference types
// 'oldArray' can not be re-assined but it's value can be modified internally because it's value is reference type
let oldArray = NSMutableArray(
    array: [
        "Foo", 
        "Bar"
    ]
)
oldArray.add("Baz")
var newArray = oldArray
newArray.add("Quux")
newArray
oldArray


// Some function may change 'let' variable value internally even the function might appear as immutable.
let someNames = NSMutableArray(
    array: [
        "Foo",
        "Bar"
    ]
)
func changeTheArray(_ array: NSArray) {
    let copy = array as! NSMutableArray
    copy.add("Baz")
}
changeTheArray(someNames)
someNames
