//
//  IPStackView.swift
//  Impact
//
//  Created by Angel Land on 3/19/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This class is a represetantio of the UIStackView
/// adding custom properties and methods.
open class IPStackView: UIStackView {
    init() {
        super.init(frame: CGRect.zero)
        configureComponent()
        onInit()
    }
    
    required public init(coder: NSCoder) {
        super.init(coder: coder)
        configureComponent()
        onInit()
    }
    
    /// This method should be override in order
    /// to exectue custom code on init.
    func onInit() { /* Override Me! */ }
}

// MARK: - Private methods

fileprivate extension IPStackView {
    /// This method configures all the components
    /// inside the view.
    func configureComponent() {
        // Disable the translate between mask and constraints.
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Public methods

extension IPStackView {
    /// This methods removes all the views inside the
    /// stack.
    func removeAll() {
        for itemView in arrangedSubviews {
            removeArrangedSubview(itemView)
            itemView.removeFromSuperview()
        }
    }
}
