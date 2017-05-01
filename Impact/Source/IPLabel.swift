//
//  IPLabel.swift
//  Impact
//
//  Created by Angel Land on 4/2/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

open class IPLabel: UILabel {
    init() {
        super.init(frame: CGRect.zero)
        configureComponent()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(frame: CGRect.zero)
        configureComponent()
    }
}

// MARK: - Public methods

extension IPLabel {
    /// This method configures all the component.
    func configureComponent() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
 
