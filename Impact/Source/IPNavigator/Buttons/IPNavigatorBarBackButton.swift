//
//  IPNavigatorBarBackButton.swift
//  Impact
//
//  Created by Angel Land on 4/9/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/*
 IPNavigatorBarBackButton:
 This class represetns the back button.
 */
class IPNavigatorBarBackButton: IPNavigatorBarButton {
    /// A weak reference to the arrow icon.
    fileprivate weak var arrow: IPArrow!
    /// This methods will be executed just after the
    /// constructor.
    override func onInit() {
        super.onInit()
        configureComponent()
        configureConstraints()
        configureArrow()
    }
    
    /// This method will be executed when the framework
    /// detects that is necesary update the constraints.
    override func layoutSubviews() {
        super.layoutSubviews()
        configureSizesAndPositions()
    }
}

// MARK: - Private methods

extension IPNavigatorBarBackButton {
    /// This method configures all the component.
    fileprivate func configureComponent() {
        // Creating the arrow.
    }
    
    fileprivate func configureConstraints() {
        IPConstraint.width.activate(withConstant: 30, andObject: self)
    }
    
    /// This method will be executed just after the layout subviews.
    fileprivate func configureSizesAndPositions() {
        arrow.frame.origin = CGPoint(
            x: frame.width / 2 - arrow.frame.width / 2,
            y: frame.height / 2 - arrow.frame.height / 2
        )
    }
    
    /// This method creates and configures the arrow,
    /// this method needs be executed just one time to
    /// avoid add multiples arrows.
    fileprivate func configureArrow() {
        let newArrow: IPArrow = IPArrow()
        layer.addSublayer(newArrow)
        arrow = newArrow
    }
}
