//: [Previous](@previous)

import Foundation
import Combine

var greeting = "Hello, playground"

struct Hero: Decodable {
    let name: String
}

let myURL = URL(string: "https://simplifiedcoding.net/demos/marvel/")

let remoteDataPublisher = URLSession.shared.dataTaskPublisher(for: myURL!)
    .map { $0.data }
    .decode(type: [Hero].self, decoder: JSONDecoder())

let cancellableSink = remoteDataPublisher
    .sink(receiveCompletion: { completion in
        print(".sink() received the completion", String(describing: completion))
        switch completion {
        case .finished:
            break
        case .failure(let anError):
            print("received error: ", anError)
        }
    }, receiveValue: { someValue in
        print(".sink() received \(someValue)")
    })

//: [Next](@next)
