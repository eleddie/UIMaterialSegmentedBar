//
//  MaterialSegmentedBar.swift
//  MaterialSegmentedBar
//
//  Created by Eduardo Sanchez on 7/26/17.
//  Copyright © 2017 Eduardo Sanchez. All rights reserved.
//

import UIKit

@IBDesignable
class MaterialSegmentedBar: UIControl {
    var selectedSegmentIndex = 0
    var buttons = [UIButton]()
    
    var selector:UIView!
    
    @IBInspectable
    var valuesSeparator:String = "," {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var uppercase:Bool = true {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var selectorColor:UIColor = .white {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var textColor: UIColor = .lightGray {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var selectedTextColor:UIColor = .white {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var separatedValues:String = "" {
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        buttons.removeAll()
        subviews.forEach{$0.removeFromSuperview()}
        
        let buttonTitles = separatedValues.components(separatedBy: valuesSeparator)
        for buttonTitle in buttonTitles{
            let button = UIButton(type: .system)
            button.setTitle(uppercase ? buttonTitle.uppercased() : buttonTitle, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            button.titleLabel?.textAlignment = .center
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectedTextColor, for: .normal)
        
        let selectorWidth = frame.width / CGFloat(buttons.count)
        selector = UIView(frame: CGRect(x: 0, y: 45, width: selectorWidth, height: 3))
        selector.backgroundColor = selectorColor
        addSubview(selector)
        
        let stackHolder = UIStackView(arrangedSubviews: buttons)
        stackHolder.axis = .horizontal
        stackHolder.alignment = .fill
        stackHolder.distribution = .fillProportionally
        
        addSubview(stackHolder)
        
        stackHolder.translatesAutoresizingMaskIntoConstraints = false
        stackHolder.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackHolder.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackHolder.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        stackHolder.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    }
    
    func buttonTapped(button: UIButton){
        for (index, btn) in buttons.enumerated(){
            btn.setTitleColor(textColor, for: .normal)
            if btn == button {
                self.selectedSegmentIndex = index
                btn.setTitleColor(selectedTextColor, for: .normal)
                UIView.animate(withDuration: 0.3, animations: {
                    self.selector.frame.origin.x = btn.frame.origin.x
                    var selectorFrame = self.selector.frame
                    selectorFrame.size.width = btn.frame.width
                    self.selector.frame = selectorFrame
                })
            }
        }
        sendActions(for: .valueChanged)
    }

}
