//: [Previous](@previous)

import Foundation
import Combine

func adaptiveLoader(regularURL: URL, lowDataURL: URL) -> AnyPublisher<Data, Error> {
    var request = URLRequest(url: regularURL)
    request.allowsConstrainedNetworkAccess = false
    return URLSession.shared.dataTaskPublisher(for: request)
        .tryCatch { error -> URLSession.DataTaskPublisher in
            guard error.networkUnavailableReason == .constrained else {
               throw error
            }
            return URLSession.shared.dataTaskPublisher(for: lowDataURL)
        .tryMap { data, response -> Data in
            guard let httpResponse = response as? HTTPUrlResponse,
                   httpResponse.statusCode == 200 else {
                       throw MyNetworkingError.invalidServerResponse
            }
            return data
}
.eraseToAnyPublisher()
            
            

//: [Next](@next)
