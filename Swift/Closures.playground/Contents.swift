import Foundation

// Closure are inline functions and used for assiging a function in a variable
let add: (Int, Int) -> Int
= { (lhs: Int, rhs: Int) -> Int in
    return lhs + rhs
    }
add(8, 18)

func customAdd(
    _ lhs: Int,
    _ rhs: Int,
    using function: (Int, Int) -> Int
) -> Int {
    function(lhs, rhs)
}
customAdd(13, 16, using: add)

// Trailing closure syntax
customAdd(
    14,
    28
) { (lhs: Int, rhs: Int) -> Int in
    return lhs + rhs
}
// Trailing closure syntax with cleanup but not recommended approach
customAdd(
    19,
    4
) { (lhs, rhs) in
    lhs + rhs
}
customAdd(5,7) {
    $0 + $1
}


let ages = [23, 45, 67, 89, 12]
ages.sorted(by: { (lhs: Int, rhs: Int) -> Bool in
    lhs < rhs
})
// Passing operators to closure
ages.sorted(by: >)
ages.sorted(by: <)


func add10To(_ num: Int) -> Int {
    num + 10
}
func add20To(num: Int) -> Int {
    num + 20
}

// Passing normal functions to a closer
func doAddition(
    on value: Int,
    using funciton: (Int) -> Int
) -> Int {
    funciton(value)
}
doAddition(
    on: 10,
    using: add10To(_:)
)
doAddition(
    on: 10,
    using: add20To(num:)
)
