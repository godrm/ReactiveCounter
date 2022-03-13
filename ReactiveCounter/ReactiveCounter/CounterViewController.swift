//
//  CounterViewController.swift
//  ReactiveCounter
//
//  Created by JK on 2022/03/13.
//

import UIKit

final class CounterViewController : UIViewController {
    class DummyState : CounterScenario {
        var count: Int  { 0 }
        func increase() {   }
        func decrease() {   }
    }
    class DummyViewModel : PresenterViewModel {
        func bind(present action: @escaping ViewUpdateClosure) { }
    }
    
    var panelMaker : PanelMaker.Type?
    private var panelView : CounterPresentable & IncreaseActionable & DecreaseActionable {
        view as! CounterPresentable & IncreaseActionable & DecreaseActionable
    }
    private var state : CounterScenario!
    private var viewModel : PresenterViewModel!
    
    init(with state: CounterScenario, viewModel: PresenterViewModel) {
        self.state = state
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.state = DummyState()
        self.viewModel = DummyViewModel()
        super.init(coder: coder)
    }
    
    override func loadView() {
        super.loadView()
        self.view = panelMaker?.makePanel(maxSize: UIScreen.main.bounds.size)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindAction()
        bindPresent()
    }
    
    private func bindAction() {
        panelView.addAction(increase: UIAction.init(handler: {
            (action) in
            self.state.increase()
        }))
        panelView.addAction(decrease: UIAction.init(handler: {
            (action) in
            self.state.decrease()
        }))
    }
    
    private func bindPresent() {
        viewModel.bind { state in
            self.panelView.present("\(self.state.count)")
        }
    }
}
