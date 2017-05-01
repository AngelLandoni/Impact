//
//  IPNavigatorBarFlow.swift
//  Impact
//
//  Created by Angel Land on 4/8/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This enum contains all the constants used
/// in the IPNavigatorBarFlow.
fileprivate enum IPNavigatorFlowBarConstants {
    static let height: CGFloat = 44
    static let leftMargin: CGFloat = 5
    static let rightMargin: CGFloat = 5
    static let defaultTitle: String = "IMPACT"
}

/// This protocol catch the events of emited by the 
/// IPNavigatorFlowBar.
public protocol IPNavigatorFlowBarHandler: class {
    func onTapBackButton()
}

open class IPNavigatorFlowBar: IPView {
    /// This var contains all the left var items.
    fileprivate let leftItems: IPHorizontalStackView = IPHorizontalStackView()
    fileprivate let middleItems: IPHorizontalStackView = IPHorizontalStackView()
    fileprivate let rightItems: IPHorizontalStackView = IPHorizontalStackView()
    /// A weak reference to the back button.
    fileprivate weak var backButton: IPNavigatorBarBackButton!
    /// A weak reference to the title.
    fileprivate weak var titleLabel: IPLabel!
    
    /// This method will be executed just after
    /// the constructor.
    override func onInit() {
        super.onInit()
        configureComponent()
        configureConstraints()
    }
}

// MARK: - Private methods.

extension IPNavigatorFlowBar {
    /// This method configures all the component.
    fileprivate func configureComponent() {
        // Adding components.
        addSubview(leftItems)
        addSubview(middleItems)
        addSubview(rightItems)
        // Adding the back button.
        let newBackButton: IPNavigatorBarBackButton = IPNavigatorBarBackButton()
        leftItems.addArrangedSubview(newBackButton)
        
        backButton = newBackButton
        // Setting the title
        let newTitle: IPLabel = IPLabel()
        newTitle.text = IPNavigatorFlowBarConstants.defaultTitle
        middleItems.addArrangedSubview(newTitle)
        // Save a reference to thte title
        titleLabel = newTitle
    }
    
    /// This methdos configures all the constriants
    /// needed.
    fileprivate func configureConstraints() {
        // Configure the height of the component.
        IPConstraint.height.activate(
            withConstant: IPNavigatorFlowBarConstants.height,
            andObject: self
        )
        // Setting left items.
        IPConstraint.left.activate(inContainer: self, withObject: leftItems, andConstant: 5)
        IPConstraint.top.activate(inContainer: self, withObject: leftItems)
        IPConstraint.bottom.activate(inContainer: self, withObject: leftItems)
        // Configure the middle items position.
        IPConstraint.center.activate(inContainer: self, withObject: middleItems)
    }
}

// MARK: - Public methods

extension IPNavigatorFlowBar {
    
}

// MARK: - Getters and Setters

extension IPNavigatorFlowBar {
    /// This getter and setter handles the back button callback.
    open var onClickBackButton: BackButtonCallback {
        get { return backButton.onClick }
        set { backButton.onClick = newValue }
    }
    /// This var handles the title's text.
    open var title: String {
        get { return titleLabel.text! }
        set { titleLabel.text = newValue }
    }
}
