//: [Previous](@previous)

import Foundation
import Combine

final class FavoritesViewModel: ObservableObject {
    @Published private(set) var products: [Product] = []
    let service = ProductsService()

    func fetch() {
        Publishers.MergeMany(
            service.fetchCachedFavorites(),
            service.fetchFavorites()
        )
        .replaceError(with: [])
        .assign(to: &$products)
    }
}

//: [Next](@next)
