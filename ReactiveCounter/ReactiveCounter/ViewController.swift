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
            self.counterViewModel.state.increase()
        }), for: .plus)
        
        buttonViewModel.bind(control: UIAction(handler: { (action) in
            self.counterViewModel.state.decrease()
        }), for: .minus)
        
        counterViewModel.bind(present: { (state) in
            self.counterViewModel.counterNumber.text = "\(state.count)"
        })
    }


}

