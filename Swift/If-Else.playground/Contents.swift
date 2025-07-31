import Foundation

let myName = "John"
let myAge = 30
let yourName = "Jane"
let yourAge = 25

if myName == "John" {
    "Your name is \(myName)"
} else if myName == "Jane" {
    "Are you Jane"
} else {
    "Okay I give up"
}

if myName == "John" && myAge == 30 {
    "Name is John and age is 30"
} else if myAge == 30 {
    "I only guess the age right"
} else {
    "I don't know what I'm  doing"
}

if myName == "John" || myAge == 30 {
    "Either Name is John, age is 30 or both"
}

if myName == "John"
    && myAge == 30
    && yourName == "Jane"
    || yourAge == 25 {
    "My name is John and I'm 30 and your name is Jane....OR.... you are 25"
}

if (myName == "John"
    && myAge == 30)
    && (yourName == "Jane"
    || yourAge == 25) {
    "My name is John and I'm 30...And... your name is Jane or you are 25"
}
