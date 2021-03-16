//
//  ButtonViewModel.swift
//  Week1
//
//  Created by JK on 2021/02/13.
//

import UIKit

class ButtonViewModel : NSObject{
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    
    enum ActionItem {
        case minus
        case plus
    }
    
    override init() {
        super.init()
    }
    
    func bind(control action: UIAction, for item: ActionItem) {
        switch item {
        case .minus:
            decreaseButton.addAction(action, for: .touchUpInside)
        case .plus:
            increaseButton.addAction(action, for: .touchUpInside)
        }
    }
}
