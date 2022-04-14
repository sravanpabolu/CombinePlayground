//: [Previous](@previous)

import Foundation
import Combine

struct PostmanEchoTimeStampCheckResponse: Decodable { var valid: Bool }

enum TestFailureCondition: Error { case invalidServerResponse }

let url = URL(string: "https://postman-echo.com/time/valid?timestamp=2016-10-10")!
 
let remoteDataPublisher = Just(url)
    .flatMap { url in
        URLSession.shared.dataTaskPublisher(for: url)
        .tryMap { data, response -> Data in
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                    throw TestFailureCondition.invalidServerResponse
            }
            return data
        }
        .decode(type: PostmanEchoTimeStampCheckResponse.self, decoder: JSONDecoder())
        .catch {_ in
            return Just(PostmanEchoTimeStampCheckResponse(valid: false))
        }
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
