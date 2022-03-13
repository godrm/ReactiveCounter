//
//  ViewPort.swift
//  ReactiveCounter
//
//  Created by JK on 2022/03/13.
//

import Foundation
import UIKit

protocol IncreaseActionable {
    func addAction(increase action: UIAction)
}

protocol DecreaseActionable {
    func addAction(decrease action: UIAction)
}

protocol CounterPresentable {
    func present(_ result: String)
}

protocol PanelMaker {
    static func makePanel(maxSize: CGSize) -> UIView
}
