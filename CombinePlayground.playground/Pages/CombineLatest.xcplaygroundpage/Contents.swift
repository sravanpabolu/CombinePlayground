//: [Previous](@previous)

import Foundation
import Combine

final class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password1: String = ""
    @Published var password2: String = ""

    var isValid: AnyPublisher<Bool, Never> {
        Publishers
            .CombineLatest3($email, $password1, $password2)
            .allSatisfy { email, password1, password2 in
                email.contains("@") &&
                    password1.count > 7 &&
                    password1 == password2
            }.eraseToAnyPublisher()
    }
}

//: [Next](@next)
