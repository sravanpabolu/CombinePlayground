//: [Previous](@previous)

import Foundation
import Contacts
import Combine

/// Example 1
let futureAsyncPublisher = Future<Bool, Error> { promise in
    CNContactStore().requestAccess(for: .contacts) { grantedAccess, err in
        // err is an optional
        if let err = err {
            return promise(.failure(err))
        }
        return promise(.success(grantedAccess))
    }
}.eraseToAnyPublisher()

/// Example 2
func fetchCompanies() -> Future<[String], Error> {
    return Future { promise in
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            promise(.success(["Apple", "Google", "Microsoft", "Meta"]))
        }
    }
}

fetchCompanies()

//: [Next](@next)
