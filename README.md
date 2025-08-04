# SwiftUI Learning Repository

This repository is dedicated to learning the SwiftUI framework for building native applications for iOS, macOS, and other Apple platforms. 

This directory focuses on the fundamental concepts of the Swift programming language, which are essential prerequisites before diving into SwiftUI application development.

## Swift Programming Language Fundamentals

*   **Variables:** Declaring and using variables and constants.
*   **Operators:** Standard arithmetic, comparison, and logical operators.
*   **If-Else:** Conditional statements for branching logic.
*   **Collections:** Working with arrays, sets, and dictionaries.
*   **Functions:** Defining and calling functions.
*   **Closures:** Understanding and using closures.
*   **Optionals:** Handling the absence of a value.
*   **Structures:** Creating custom value types.
*   **Classes:** Creating custom reference types.
*   **Enumerations:** Defining custom types with a finite set of related values.
*   **Protocols:** Defining blueprints of methods, properties, and other requirements.
*   **Extensions:** Adding new functionality to existing types.
*   **Generics:** Writing flexible and reusable code.
*   **Error Handling:** Responding to and recovering from errors.
*   **Equality & Hashing:** Conforming to `Equatable` and `Hashable` protocols.
*   **Custom Operators:** Defining custom infix, prefix, postfix, and assignment operators.
*   **Async Programming:** Understanding and using `async/await` for concurrent code.

## FaceFacts: iOS App

FaceFacts is a SwiftUI-based iOS application designed to help you remember the people you meet at various events. It allows you to store essential details about individuals, including their name, email address, a personal photo, and notes. You can also create events and associate people with the specific event where you met them.

### Features

*   **Add and Manage People**: Easily add new people to your list, edit their information, or remove them.
*   **Detailed Profiles**: For each person, you can store:
    *   Name
    *   Email Address
    *   A photo from your library
    *   General notes or details
*   **Event Tracking**: Create events with a name and location to keep track of where you met each person.
*   **Search Functionality**: Quickly find people by searching for their name, email, or any detail in their notes.
*   **Sort Options**: Sort your list of people alphabetically by name (A-Z or Z-A).
*   **Data Persistence**: Your data is saved locally on your device using SwiftData.

### How to Use

1.  **Main Screen**: The app opens to a list of all the people you have saved.
2.  **Add a Person**: Tap the "+" button in the toolbar to add a new person.
3.  **Edit Person Details**: After adding a person, you'll be taken to a screen where you can enter their name, email, and other details. You can also select a photo from your photo library.
4.  **Manage Events**:
    *   In the "Where did you meet them?" section, you can assign a person to an existing event.
    *   If the event doesn't exist yet, you can tap "Add a new event" to create it.
5.  **Search and Sort**: Use the search bar at the top to find people, and use the sort menu to reorder your list.
6.  **Delete a Person**: On the main list, you can swipe to delete a person.
