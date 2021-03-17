# ReactiveCounter

Plus 또는 Minus 버튼을 클릭하면 현재 상태값을 기준으로
아주 간단하게 카운터를 올리거나 내리는 예제 프로그램입니다.

### 특이사항

- ViewModel Object를 스토리보드 TopLevelObject로 등록함

#### 동작 흐름

![ControllerViewModel](https://github.com/godrm/ReactiveCounter/blob/step0-ViewModel/Images/ControllerViewModel.png?raw=true)

- Button IBAction과 이벤트 연결하고, Action을 전달하는 과정을 ButtonViewModel 에서 처리

- action 이벤트를 받아서 어느 값에 binding할 지는 ViewController에서 선언

```swift
buttonViewModel.bind(control: { (control, action) in
    switch action {
    case .plus:
        self.counterViewModel.state.count += 1
    case .minus:
        self.counterViewModel.state.count -= 1
    }
})
```

![PresenterViewModel](https://github.com/godrm/ReactiveCounter/blob/step0-ViewModel/Images/PresenterViewModel.png?raw=true)

- CountNumber IBOutlet 연결과 값을 표시하는 과정은 CounterViewModel 에서 처리

- CounterViewModel.State 값이 바뀐 이후 어느 뷰에 값을 표시할 지는 ViewController에서 선언

```swift
counterViewModel.bind(present: { (state) in
    self.counterViewModel.counterNumber.text = "\(state.count)"
})
```

