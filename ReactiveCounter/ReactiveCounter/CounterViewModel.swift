//
//  CounterViewModel.swift
//  Week1
//
//  Created by JK on 2021/02/13.
//

import UIKit

protocol BaseViewModel {
    associatedtype State
    var state : State{ get }
}

protocol Presentable {
    func notifyChanged<T:BaseViewModel>(with viewModel: T)
}

struct CounterViewModel : BaseViewModel {
    typealias State = CounterState
    let state: State
}

class CounterPresenter : NSObject, Presentable {
    @IBOutlet weak var counterNumber: UILabel!
    
    override init() {
        super.init()
    }
    
    func notifyChanged<T:BaseViewModel>(with viewModel: T) {
        guard let state = viewModel.state as? CounterState else { return }
        counterNumber.text = "\(state.count)"
    }
}
