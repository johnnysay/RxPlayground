import Foundation
import RxSwift

public protocol FakeHTTPClient {
    func createObservableAsyncObject<T>(_ object: T) -> Observable<T>
    func throwObservableError<T>(_ error: PreconditionError) -> Observable<T>
}

public extension FakeHTTPClient {

    func createObservableAsyncObject<T>(_ object: T) -> Observable<T> {
        Observable<Int>
            .interval(.milliseconds(Int.random(in: 200 ..< 800)),
                      scheduler: MainScheduler.instance)
            .take(1)
            .map { _ in return object }
    }

    func throwObservableError<T>(_ error: PreconditionError) -> Observable<T> {
        Observable<Int>
            .interval(.milliseconds(Int.random(in: 200 ..< 800)),
                      scheduler: MainScheduler.instance)
            .take(1)
            .flatMap { _ in Observable<T>.error(error) }
    }
}

public enum PreconditionError: Error {
    case generic
}
