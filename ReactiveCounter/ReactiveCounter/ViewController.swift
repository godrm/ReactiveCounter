//
//  ViewController.swift
//  ReactiveCounter
//
//  Created by JK on 2021/02/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var buttonViewModel: ButtonViewModel!
    @IBOutlet var counterViewModel: CounterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonViewModel.bind(control: UIAction(handler: { (action) in
            IncreaseUsecase.action(with: self.counterViewModel.state)
        }), for: .plus)
        
        buttonViewModel.bind(control: UIAction(handler: { (action) in
            DecreaseUsecase.action(with: self.counterViewModel.state)
        }), for: .minus)
        
        counterViewModel.bind(present: { (state) in
            self.counterViewModel.counterNumber.text = "\(state.count)"
        })
    }
}

