//
//  StatePort.swift
//  ReactiveCounter
//
//  Created by JK on 2022/03/13.
//

import Foundation

protocol CounterScenario {
    var count : Int { get }
    func increase()
    func decrease()
}
