//
//  IPNavigatorBar.swift
//  Impact
//
//  Created by Angel Land on 4/7/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

open class IPNavigatorBar: IPView {
    /// This var contains the ref to the basic stack
    /// view.
    fileprivate let stackView: IPVerticalStackView = IPVerticalStackView()
    /// This var is a ref to the status bar.
    fileprivate weak var statusBar: IPNavigatorStatusBar! = nil
    
    /// This method will be executed just after the
    /// constructor.
    override func onInit() {
        super.onInit()
        configureComponent()
        configureConstraints()
    }
    
    /// This method will be exectued just after add
    /// the view to the parent view.
    open override func didMoveToSuperview() {
        super.didMoveToSuperview()
        configureFixedConstraints()
    }
}

// MARK: - Private methods

fileprivate extension IPNavigatorBar {
    /// This method configures all the component.
    func configureComponent() {
        backgroundColor = IPColor.White.getRGB()
        addSubview(stackView)
        // Adding the status bar.
        let newStatusBar: IPNavigatorStatusBar = IPNavigatorStatusBar()
        // Save a weak reference inside the component.
        statusBar = newStatusBar
        stackView.addArrangedSubview(newStatusBar)
    }
    
    /// This method configures all the
    func configureConstraints() {
        IPConstraint.fill.activate(inContainer: self, withObject: stackView)
    }
    
    /// This methdo configures the basic constraints.
    func configureFixedConstraints() {
        // Adding constraints to itself.
        IPConstraint.left.activate(inContainer: superview!, withObject: self)
        IPConstraint.right.activate(inContainer: superview!, withObject: self)
        IPConstraint.top.activate(inContainer: superview!, withObject: self)
    }
}

// MARK:  - Public methods

extension IPNavigatorBar {
    /// This method adds the a new component inside
    /// the stack.
    /// - parameter bar: The view to add to the stack view.
    public func add(actionBar bar: IPView) { stackView.addArrangedSubview(bar) }
}
