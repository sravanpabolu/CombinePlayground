//: [Previous](@previous)

import Foundation
import Combine

/// Operator - max()
/// Find longest word and print the number of characters of the longest word
///

let maxWordLength: AnyPublisher<Int, Never>
maxWordLength = Just("The quick brown fox jumps over the lazy dog")
    .map { $0.split(separator: " ") }
    .flatMap { $0.publisher }
    .map { $0.count }
    .max()
    .eraseToAnyPublisher()

maxWordLength.sink(receiveValue: { print($0) })

//: [Next](@next)
