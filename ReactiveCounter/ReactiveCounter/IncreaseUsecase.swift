//
//  IncreaseUsecase.swift
//  ReactiveCounter
//
//  Created by JK on 2021/03/16.
//

import Foundation

protocol CounterIncreasable : Commandable {
    func increase()
}

struct IncreaseUsecase : UsecaseActionable {
    static func action(with state:CounterIncreasable) {
        state.increase()
    }
}
