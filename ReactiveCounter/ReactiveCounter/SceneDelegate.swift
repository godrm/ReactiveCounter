//
//  SceneDelegate.swift
//  ReactiveCounter
//
//  Created by JK on 2021/02/13.
//

import UIKit


final class PresenterFactory : PresenterMaker {
    static func makePresenter(with state: CounterState) -> PresenterViewModel {
        return CounterPresenter<CounterState>(with: state)
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow.init(windowScene: windowScene)
        let state = CounterState()
        let viewModel = PresenterFactory.makePresenter(with: state)
        let viewController = CounterViewController.init(with: state, viewModel: viewModel)
        viewController.panelMaker = PanelFactory.self
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
    }
}

