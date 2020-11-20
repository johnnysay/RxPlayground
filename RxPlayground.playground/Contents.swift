import RxSwift

private let disposeBag = DisposeBag()
let publishSubject = PublishSubject<String>()

publishSubject.subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)

publishSubject.onNext("Hello world")
