//
//  IPViewController.swift
//  Impact
//
//  Created by Angel Land on 3/19/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This class represent the UIViewController with
/// custom things.
open class IPViewController: UIViewController {
    required public init() {
        super.init(nibName: nil, bundle: nil)
        onInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        onInit()
    }
    
    /// This method will be colled just after the
    /// constructor.
    open func onInit() { /* Override Me! */ }
}
