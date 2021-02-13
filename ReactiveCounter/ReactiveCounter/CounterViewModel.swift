//
//  CounterViewModel.swift
//  Week1
//
//  Created by JK on 2021/02/13.
//

import UIKit
import Combine

protocol PresenterViewModel {
    associatedtype State
    typealias ViewUpdateClosure = (State) -> ()
    func bind(present action: @escaping ViewUpdateClosure)
}

class CounterViewModel : NSObject, PresenterViewModel {
    class State : ObservableObject {
        var count : Int {
            didSet {
                objectWillChange.send()
            }
        }
        init() {
            count = 0
        }
    }
    
    @IBOutlet weak var counterNumber: UILabel!
    var state : State
    private var presenterHandler : ViewUpdateClosure
    private var cancellable : AnyCancellable?
    
    override init() {
        presenterHandler = { (_) in }
        state = State()
        super.init()
        cancellable = state.objectWillChange.sink {
            self.presenterHandler(self.state)
        }
    }
    
    func bind(present action: @escaping ViewUpdateClosure) {
        self.presenterHandler = action
    }
}
