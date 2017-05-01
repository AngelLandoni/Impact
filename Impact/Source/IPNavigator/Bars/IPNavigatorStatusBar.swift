//
//  IPNavigatorStatusBar.swift
//  Impact
//
//  Created by Angel Land on 4/8/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This enum contains all the constatants used 
// in the class IPNavigatorStatusBar.
fileprivate enum IPNavigatorStatusBarConstants {
    static let height: CGFloat = 20
}

open class IPNavigatorStatusBar: IPView {
    /// This method will be executed just after
    /// the constructor.
    override func onInit() {
        super.onInit()
        configureComponent()
    }
}

// MARK: - Private methods

fileprivate extension IPNavigatorStatusBar {
    /// This method configure all the component.
    func configureComponent() {
        // Setting the height of the component.
        IPConstraint.height.activate(
            withConstant: IPNavigatorStatusBarConstants.height,
            andObject: self
        )
    }
}
