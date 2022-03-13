//
//  PanelView.swift
//  ReactiveCounter
//
//  Created by JK on 2022/03/13.
//

import UIKit

final class PanelFactory : PanelMaker {
    static func makePanel(maxSize : CGSize = CGSize(width: 200, height: 200)) -> UIView {
        return PanelView.init(frame: CGRect(origin: CGPoint.zero, size: maxSize))
    }
}

final class PanelView : UIView, CounterPresentable {
    private var increaseButton : UIButton!
    private var decreaseButton : UIButton!
    private var resultLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadSubviews()
    }
    
    private func loadSubviews() {
        self.backgroundColor = UIColor.white
        
        increaseButton = UIButton.init(type: .custom)
        increaseButton.frame = CGRect(x: 40, y: 100, width: 160, height: 80)
        increaseButton.backgroundColor = UIColor.clear
        increaseButton.setTitle("Plus(+)", for: .normal)
        increaseButton.setTitleColor(.darkGray, for: .normal)
        self.addSubview(increaseButton)
        
        resultLabel = UILabel.init(frame: CGRect(x: 170, y: 120, width: 80, height: 40))
        resultLabel.textColor = UIColor.black
        resultLabel.font = UIFont.systemFont(ofSize: 20)
        resultLabel.textAlignment = .center
        resultLabel.text = "0"
        self.addSubview(resultLabel)
        
        decreaseButton = UIButton.init(type: .custom)
        decreaseButton.frame = CGRect(x: 220, y: 100, width: 160, height: 80)
        decreaseButton.backgroundColor = UIColor.clear
        decreaseButton.setTitle("Minus(-)", for: .normal)
        decreaseButton.setTitleColor(.darkGray, for: .normal)
        self.addSubview(decreaseButton)
    }
        
    public func present(_ result: String) {
        resultLabel.text = result
    }
}

extension PanelView: IncreaseActionable {
    public func addAction(increase action: UIAction) {
        increaseButton.addAction(action, for: .touchUpInside)
    }
}

extension PanelView: DecreaseActionable {
    public func addAction(decrease action: UIAction) {
        decreaseButton.addAction(action, for: .touchUpInside)
    }
}
