//
//  CounterViewModel.swift
//  Week1
//
//  Created by JK on 2021/02/13.
//

import UIKit

protocol Presentable {
    func notifyChanged<T:BaseViewModel>(with viewModel: T)
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
