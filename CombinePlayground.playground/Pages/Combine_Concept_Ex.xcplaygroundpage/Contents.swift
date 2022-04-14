import UIKit

var greeting = "Hello, Combine"
print(greeting)

/*
When to use Combine:
 
You can set up pipelines to enable a button for submission only when values entered into the fields are valid.

A pipeline can also do asynchronous actions (such as checking with a network service) and using the values returned to choose how and what to update within a view.

Pipelines can also be used to react to a user typing dynamically into a text field and updating the user interface view based on what they’re typing.

*/

/*
 Publishers:
 Just
 Future
 Deferred
 Empty
 Sequence
 Fail
 Record
 Share
 Multicast
 ObservableObject
 @Published
 */

/*
 Operators:
 
 Mapping elements:
 scan
 tryScan
 setFailureType
 map
 tryMap
 flatMap
 
 Filtering elements:
 compactMap
 tryCompactMap
 replaceEmpty
 filter
 tryFilter
 replaceError
 removeDuplicates
 tryRemoveDuplicates
 
 Reducing elements:
 collect
 reduce
 tryReduce
 ignoreOutput
 
 Mathematic operations on elements:
 max
 tryMax
 count
 min
 tryMin

 Applying matching criteria to elements:
 allSatisfy
 tryAllSatisfy
 contains
 containsWhere
 tryContainsWhere

 Applying sequence operations to elements:
 firstWhere
 tryFirstWhere
 first
 lastWhere
 tryLastWhere
 last
 dropWhile
 tryDropWhile
 dropUntilOutput
 prepend
 drop
 prefixUntilOutput
 prefixWhile
 tryPrefixWhile
 output

 Combining elements from multiple publishers
 combineLatest
 merge
 zip
 
 Handling errors
 catch
 tryCatch
 assertNoFailure
 retry
 mapError

 Adapting publisher types
 switchToLatest
 eraseToAnyPublisher

 Controlling timing
 debounce
 delay
 measureInterval
 throttle
 timeout

 Encoding and decoding
 encode
 decode

 Working with multiple subscribers
 multicast

 Debugging
 breakpoint
 handleEvents
 print
 */

/*
 Subjects:
 Subjects are a special case of publisher that also adhere to the Subject protocol.
 Subjects can be used to "inject" values into a stream, by calling the subject’s .send(_:) method.
 A subject can also broadcast values to multiple subscribers. If multiple subscribers are connected to a subject, it will fan out values to the multiple subscribers when send(_:) is invoked.
 
 CurrentValueSubject -  remembers and requires an initial state
 PassthroughSubject -  doesn't requires an initial state.
 Both will provide updated values to any subscribers when .send() is invoked.

 */


/*
 Subscribers:
 Subscriber is the protocol used to receive data throughout a pipeline, the subscriber typically refers to the end of a pipeline.

 There are two subscribers built-in to Combine: Assign and Sink. There is a subscriber built in to SwiftUI: onReceive.


 */
