//
//  IPWindow.swift
//  Impact
//
//  Created by Angel Land on 3/19/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This class warps the UIWindow.
open class IPWindow: UIWindow {
    public init() {
        super.init(frame: UIScreen.main.bounds)
        configureComponent()
        onInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureComponent()
        onInit()
    }
    
    /// This method will be exectued just after
    /// the constructor
    open func onInit() { /* Override Me! */ }
}

// MARK: - Private methods

private extension IPWindow {
    /// This method configures the component.
    func configureComponent() {
        makeKeyAndVisible()
    }
}

// MARK: - Public methods

public extension IPWindow {
    
}
