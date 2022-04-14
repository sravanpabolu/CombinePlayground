//: [Previous](@previous)

import Foundation
import Combine

typealias MarvelHeros = [MarvelHero]

enum TestFailureCondition: Error { case invalidServerResponse }

struct MarvelHero: Decodable { }

let url = URL(string: "https://simplifiedcoding.net/demos/marvel/")!
let remoteDataPublisher = URLSession.shared.dataTaskPublisher(for: url)
    .delay(for: DispatchQueue.SchedulerTimeType.Stride(integerLiteral: Int.random(in: 1..<5)), scheduler: DispatchQueue.global())
    .retry(3)
    .tryMap { data, response -> Data in
        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
                throw TestFailureCondition.invalidServerResponse
        }
        return data
    }
    .decode(type: MarvelHeros.self, decoder: JSONDecoder())
    .subscribe(on: DispatchQueue.global())
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
