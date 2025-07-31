import Foundation

/// Single generic parameters
func perform<T: Numeric>(_ op: (T, T) -> T, lhs: T, rhs: T) -> T {
    return op(lhs, rhs)
}

let x = perform(+, lhs: 10, rhs: 20)
perform(*, lhs: 10, rhs: 20)

/// Mutiple generic parameters
protocol CanJump {
    func jump()
}
protocol CanRun {
    func run()
}

struct Person: CanJump, CanRun {
    func jump() {
        "Jumping....."
    }
    
    func run() {
        "Running....."
    }
}

func jumpAndRun<T: CanJump & CanRun>(_ value: T) {
    value.jump()
    value.run()
}

let person = Person()
jumpAndRun(person)

/// Extension on generic type
extension [String] {
    func logestString() -> String? {
        self.sorted { (lhs: String, rhs: String) -> Bool in
               lhs.count > rhs.count
        }.first
    }
}

[
    "Foo",
    "Bar Baz",
    "Qux"
].logestString()

extension Array<Int> {
    func average() -> Double {
        Double(self.reduce(0, +)) / Double(self.count)
    }
}

[1, 2, 3, 4].average()

/// Generic protocols
protocol View {
    func addView(_ view: View)
}

extension View {
    func addView(_ view: View) {
       // Empty
    }
}

struct Button: View {
    
}

struct Table: View {
    
}

// Protocols can become generic with associatedtype
protocol PresentableView {
    associatedtype ViewType: View
    
    func produceView() -> ViewType
    
    func configure(
        superView: View,
        thisView: ViewType
    )
    
    func present(
        view: ViewType,
        on superView: View
    )
}

extension PresentableView {
    func configure(
        superView: View,
        thisView: ViewType
    ) {
        
    }
    
    func present(
        view: ViewType,
        on superView: View
    ) {
        superView.addView(view)
    }
}

struct MyButton: PresentableView {
    func produceView() -> Button {
        Button()
    }
    
    func configure(superView: any View, thisView: Button) {
        
    }
    
    func present(view: Button, on superView: any View) {
        
    }
}

// Extension on any object that conforms to Presentable view as long as that object view type is button
extension PresentableView where ViewType == Button {
    func doSomethingWithButton() {
        "This is an button"
    }
}

let button = MyButton()
button.doSomethingWithButton()


struct MyTable: PresentableView {
    func produceView() -> Table {
        Table()
    }
}

let table = MyTable()
// table does not have access to the doSomethingWithButton method
