//
//  ButtonViewModel.swift
//  Week1
//
//  Created by JK on 2021/02/13.
//

import UIKit

protocol ControllerViewModel {
    associatedtype Action
    typealias ControlActionClosure = (UIControl, Action) -> ()
    func bind(control action: @escaping ControlActionClosure)
}

class ButtonViewModel : NSObject, ControllerViewModel{
    enum Action {
        case plus
        case minus
    }

    @IBAction func plus(_ sender: UIControl) {
        controllerHandler(sender, Action.plus)
    }
    
    @IBAction func minus(_ sender: UIControl) {
        controllerHandler(sender, Action.minus)
    }

    private var controllerHandler : ControlActionClosure
    
    override init() {
        controllerHandler = { (_, _) in }
        super.init()
    }
    
    func bind(control action: @escaping ControlActionClosure) {
        self.controllerHandler = action
    }
}
