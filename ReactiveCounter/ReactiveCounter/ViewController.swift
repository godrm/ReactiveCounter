//
//  ViewController.swift
//  ReactiveCounter
//
//  Created by JK on 2021/02/13.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet var buttonViewModel: ButtonController!
    @IBOutlet var counterPresenter: CounterPresenter!
    
    private var state = CounterState()
    private var cancellable : AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonViewModel.bind(control: UIAction(handler: { (action) in
            IncreaseUsecase.action(with: self.state)
        }), for: .plus)
        
        buttonViewModel.bind(control: UIAction(handler: { (action) in
            DecreaseUsecase.action(with: self.state)
        }), for: .minus)

        cancellable = state.objectWillChange.sink {
            self.counterPresenter.notifyChanged(with: CounterViewModel(state: self.state))
        }
    }
}

