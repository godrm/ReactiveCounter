//
//  CounterViewModel.swift
//  Week1
//
//  Created by JK on 2021/02/13.
//

import UIKit

protocol PresenterViewModel {
    associatedtype State
    typealias ViewUpdateClosure = (State) -> ()
    func bind(present action: @escaping ViewUpdateClosure)
}

class CounterViewModel : NSObject, PresenterViewModel {
    struct State {
        var count : Int
        {
            didSet {
                handler(self)
            }
        }
        private var handler : ViewUpdateClosure
        init(with handler : @escaping ViewUpdateClosure = { _ in }) {
            count = 0
            self.handler = handler
        }
    }
    
    @IBOutlet weak var counterNumber: UILabel!
    var state : State
    private var presenterHandler : ViewUpdateClosure
    
    override init() {
        presenterHandler = { (_) in }
        state = State()
        super.init()
        state = State(with: { (state) in
            self.presenterHandler(state)
        })
    }
    
    func bind(present action: @escaping ViewUpdateClosure) {
        self.presenterHandler = action
    }
}
