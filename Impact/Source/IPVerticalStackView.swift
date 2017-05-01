//
//  IPVerticalStackView.swift
//  Impact
//
//  Created by Angel Land on 4/8/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This class represetns the vertical stack view.
/// it is configured by default.
open class IPVerticalStackView: IPStackView {
    /// This method will be executed just after
    /// the constructor.
    override func onInit() {
        configureComponent()
    }
}

// MARK: - Private methods

fileprivate extension IPVerticalStackView {
    /// This method configures all the components 
    /// inside the class.
    func configureComponent() {
        axis = .vertical
        alignment = .fill
        distribution = .fill
    }
}
