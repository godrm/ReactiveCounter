//
//  DecreaseUsecase.swift
//  ReactiveCounter
//
//  Created by JK on 2021/03/17.
//

import Foundation

protocol CounterDecreasable : Commandable {
    func decrease()
}

struct DecreaseUsecase : UsecaseActionable {
    static func action(with state:CounterDecreasable) {
        state.decrease()
    }
}
