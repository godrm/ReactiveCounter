//
//  BaseViewModel.swift
//  ReactiveCounter
//
//  Created by JK on 2021/04/05.
//

import Foundation

protocol BaseViewModel {
    associatedtype State
    var state : State{ get }
}
