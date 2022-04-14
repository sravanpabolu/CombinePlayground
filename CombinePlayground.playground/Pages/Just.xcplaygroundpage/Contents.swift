//: [Previous](@previous)

import Foundation
import Combine

var greeting = "Simple Code"

let _ = Just(5)
    .map { value -> String in
        // do something with the incoming value here
        // and return a string
        return "\(value)"
    }
    .sink { receivedValue in
        // sink is the subscriber and terminates the pipeline
        print("The end result was \(receivedValue)")
    }

//: [Next](@next)
