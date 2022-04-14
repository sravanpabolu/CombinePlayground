//: [Previous](@previous)

import Foundation
import Combine

struct IPInfo: Codable {
    var ip: String
}

let myURL = URL(string: "https://ip.jsontest.com")

let remoteDataPublisher = URLSession.shared.dataTaskPublisher(for: myURL!)
    .map({ (inputTuple) -> Data in
        return inputTuple.data
    })
    .decode(type: IPInfo.self, decoder: JSONDecoder())
    .catch { err in
        return Just(IPInfo(ip: "8.8.8.8"))
    }
    .eraseToAnyPublisher()

remoteDataPublisher
    .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let err):
            print(err.localizedDescription)
        case .finished:
            print("finished")
        }
    }, receiveValue: { val in
        print(val)
    })

//: [Next](@next)
