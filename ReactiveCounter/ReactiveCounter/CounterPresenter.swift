//
//  CounterViewModel.swift
//  Week1
//
//  Created by JK on 2021/02/13.
//

import Foundation
import Combine

final class CounterPresenter<State> : NSObject, PresenterViewModel where State : ObservableObject {
    private(set) var state : State
    private var presenterHandler : ViewUpdateClosure
    private var cancellable : AnyCancellable?
    
    init(with state: State) {
        self.state = state
        self.presenterHandler = { (_) in }
        super.init()
        cancellable = state.objectWillChange.sink { _ in
            self.presenterHandler(self.state)
        }
    }
    
    func bind(present action: @escaping ViewUpdateClosure) {
        self.presenterHandler = action
    }
}
