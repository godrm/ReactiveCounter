//
//  ViewModelPort.swift
//  ReactiveCounter
//
//  Created by JK on 2022/03/13.
//

import Foundation

protocol PresenterViewModel {
    typealias ViewUpdateClosure = (Any) -> ()
    func bind(present action: @escaping ViewUpdateClosure)
}

protocol PresenterMaker {
    static func makePresenter(with state: CounterState) -> PresenterViewModel
}
