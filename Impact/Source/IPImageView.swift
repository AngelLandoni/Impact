//
//  IPImageView.swift
//  Impact
//
//  Created by Angel Land on 3/19/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This class represetns the UIImageView
/// with custom events and properties.
class IPImageView: UIImageView {
    
    required init() {
        super.init(frame: CGRect.zero)
        configureComponent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureComponent()
    }
}

// MARK: - Private methods

fileprivate extension IPImageView {
    /// This method configures all the component.
    func configureComponent() {
        // Change this property in order to avoid change the masks
        // into constraints (support constraints by code).
        translatesAutoresizingMaskIntoConstraints = false
    }
}
