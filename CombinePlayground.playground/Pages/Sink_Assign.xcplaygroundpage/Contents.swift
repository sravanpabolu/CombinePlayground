//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

/// Simple Sink
let cancellablePipelineSimpleSink = publishingSource.sink { someValue in
    print(".sink() received \(someValue)")
})

/// sink with completions and data
let cancellablePipeline = publishingSource.sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        print("Finished")
        break
    case .failure(let anError):
        print("received the error: ", anError)
        break
    }
}, receiveValue: { someValue in
    print(".sink() received \(someValue)")
})

cancellablePipeline.cancel()


/// Simple Assign
let cancellablePipelineAssign = publishingSource
    .receive(on: RunLoop.main)
    .assign(to: \.isEnabled, on: yourButton)

cancellablePipelineAssign.cancel()

//: [Next](@next)
