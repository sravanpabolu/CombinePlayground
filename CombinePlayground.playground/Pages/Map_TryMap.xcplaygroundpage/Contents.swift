//: [Previous](@previous)

import Foundation
import Combine

var greeting = "Hello, playground"

/*
 The map operator allows for any combination of Output and Failure type and passes them through.
 tryMap accepts any Input, Failure types, and allows any Output type, but will always output an <Error> failure type.
 */

let _ = Just(5)
    .map { value -> String in
        switch value {
        case _ where value < 1:
            return "none"
        case _ where value == 1:
            return "one"
        case _ where value == 2:
            return "couple"
        case _ where value == 3:
            return "few"
        case _ where value > 8:
            return "many"
        default:
            return "some"
        }
    }
    .sink { receivedValue in
        print("The end result was \(receivedValue)")
    }

//: [Next](@next)
