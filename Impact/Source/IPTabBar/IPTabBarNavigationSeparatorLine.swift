//
//  IPTabBarNavigationSeparatorLine.swift
//  Impact
//
//  Created by Angel Land on 3/20/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

fileprivate enum IPTabBarNavigationSeparatorLineConstants {
    static let height: CGFloat = 0.5
}

/// This class represnts the separator line of the
/// navigation view.
class IPTabBarNavigationSeparatorLine: CALayer {
    override init() {
        super.init()
        configureComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureComponents()
    }
}

// MARK: - Private methods

fileprivate extension IPTabBarNavigationSeparatorLine {
    /// This method configures all the components
    /// inside the class.
    func configureComponents() {
        backgroundColor = IPColor.Gray.getRGB().cgColor
    }
}

// MARK: - Public methods

extension IPTabBarNavigationSeparatorLine {
    /// This method sets the size of the component.
    func set(width: CGFloat) {
        // Setting size.
        frame.size = CGSize(
            width: width,
            height: IPTabBarNavigationSeparatorLineConstants.height
        )
    }
    
    /// This method sets the position of the component.
    func set(position: CGPoint) {
        // Setting position.
        frame.origin = position
    }
}
