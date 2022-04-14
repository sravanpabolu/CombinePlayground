//: [Previous](@previous)

import Foundation
import Combine

final class ProductViewModel: ObservableObject {
    @Published private(set) var product: Product?
    @Published private(set) var related: [Product] = []

    let service = ProductsService()
    private var cancellable: AnyCancellable?

    func fetch(_ product: UUID) {
        cancellable = Publishers.Zip(
            service.fetch(product),
            service.fetchRelatedProducts(for: product)
        )
        .sink(
            receiveCompletion: { print($0) },
            receiveValue: { [weak self] product, related in
                self?.product = product
                self?.related = related
            }
        )
    }
}

//: [Next](@next)
