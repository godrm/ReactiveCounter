# ReactiveCounter

Plus 또는 Minus 버튼을 클릭하면 현재 상태값을 기준으로
아주 간단하게 카운터를 올리거나 내리는 예제 프로그램입니다.

### 특이사항

- ViewModel Object를 스토리보드 TopLevelObject로 등록함
- CounterViewModel에서 State를 Combine.ObservableObject 로 적용
    - 값이 바뀐 이후에 통보하도록 `@Published` 대신 didSet에서 objectWillChange.send() 처리
- ButtonViewModel에서 UIAction을 bind할 수 있도록 함

#### 동작 흐름

![ButtonViewModel](https://github.com/godrm/ReactiveCounter/blob/step3-Action/Images/step3-ButtonViewModel.png?raw=true)

- Button IBOutlet과 이벤트 연결하고, UIAction을 생성해서 전달하면 버튼과 bind

```swift
class ButtonViewModel : NSObject{
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    
    enum ActionItem {
        case minus
        case plus
    }
    
    override init() {
        super.init()
    }
    
    func bind(control action: UIAction, for item: ActionItem) {
        switch item {
        case .minus:
            decreaseButton.addAction(action, for: .touchUpInside)
        case .plus:
            increaseButton.addAction(action, for: .touchUpInside)
        }
    }
}
```

- 특정 ActionItem에 대한 binding 코드는 UIAction+클로저 형태로 ViewController에서 선언

```swift
buttonViewModel.bind(control: UIAction(handler: { (action) in
    self.counterViewModel.state.increase()
}), for: .plus)

buttonViewModel.bind(control: UIAction(handler: { (action) in
    self.counterViewModel.state.decrease()
}), for: .minus)
```

![PresenterViewModel](https://github.com/godrm/ReactiveCounter/blob/step0-ViewModel/Images/PresenterViewModel.png?raw=true)

- CountNumber IBOutlet 연결과 값을 표시하는 과정은 CounterViewModel 에서 처리

- CounterViewModel.State 값이 바뀐 이후 어느 뷰에 값을 표시할 지는 ViewController에서 선언

```swift
counterViewModel.bind(present: { (state) in
    self.counterViewModel.counterNumber.text = "\(state.count)"
})
```

