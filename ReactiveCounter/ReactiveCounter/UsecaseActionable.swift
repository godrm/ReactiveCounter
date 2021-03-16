//
//  UsecaseActionable.swift
//  ReactiveCounter
//
//  Created by JK on 2021/03/17.
//

import Foundation

protocol Commandable {
}

protocol UsecaseActionable {
    associatedtype State
    static func action(with state: State)
}
