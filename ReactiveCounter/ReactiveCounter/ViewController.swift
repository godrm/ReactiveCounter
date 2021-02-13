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
        buttonViewModel.bind(control: { (control, action) in
            switch action {
            case .plus:
                self.counterViewModel.state.count += 1
            case .minus:
                self.counterViewModel.state.count -= 1
            }
        })
        counterViewModel.bind(present: { (state) in
            self.counterViewModel.counterNumber.text = "\(state.count)"
        })
    }


}

