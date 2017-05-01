//
//  IPButton.swift
//  Impact
//
//  Created by Angel Land on 4/14/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

public typealias IPButtonTapEvent = () -> Void

open class IPButton: IPView {
    /// This var contains the callback to execute when
    /// the component is a taped.
    fileprivate var onTapEvent: IPButtonTapEvent!
    /// This var handles the tap.
    fileprivate var tapGesture: UITapGestureRecognizer!
    /// This var contains the title of
    ///the button.
    fileprivate let titleLabel: IPLabel = IPLabel()
    /// This method will be executed just after the
    /// constructor.
    override func onInit() {
        super.onInit()
        configureComponent()
        configureConstraints()
    }
}

// MARK: - Private methods

extension IPButton {
    /// This method configures the all the component.
    fileprivate func configureComponent() {
        tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(IPButton.tapHandler)
        )
        addGestureRecognizer(tapGesture)
        addSubview(titleLabel)
        // Setting title.
        titleLabel.textAlignment = .center
    }
    
    /// This method configures the constraints.
    fileprivate func configureConstraints() {
        // Adding constraints for the label.
        IPConstraint.fill.activate(inContainer: self, withObject: titleLabel)
    }
}

// MARK: - Public methods

extension IPButton {
    /// This method will be executed when the user
    /// tap on the component.
    open func tapHandler() {
        guard onTapEvent != nil else { return }
        onTapEvent()
    }
}

// MARK: - Getters and Setters

extension IPButton {
    /// This var handles the tap on the component.
    open var onTap: IPButtonTapEvent {
        get { return onTapEvent }
        set { onTapEvent = newValue }
    }

    /// This var handles the text of the title.
    open var title: String {
        get { return titleLabel.text! }
        set {
            titleLabel.text = newValue
            titleLabel.sizeToFit()
        }
    }
}
