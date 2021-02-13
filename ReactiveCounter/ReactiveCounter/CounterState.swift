//
//  CounterState.swift
//  ReactiveCounter
//
//  Created by JK on 2021/02/13.
//

import Foundation

class CounterState : ObservableObject {
    private(set) var count : Int {
        didSet {
            objectWillChange.send()
        }
    }
    init() {
        count = 0
    }
    
    func increase() {
        self.count += 1
    }
    
    func decrease() {
        self.count -= 1
    }
}

