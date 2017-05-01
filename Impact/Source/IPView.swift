//
//  IPView.swift
//  Impact
//
//  Created by Angel Land on 3/19/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This class represents a UIView with
/// custom events and properties.
open class IPView: UIView {
    required public init() {
        super.init(frame: CGRect.zero)
        onInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        onInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        onInit()
    }
    
    /// This method will be called just after
    /// the object constructor.
    func onInit() {
        /* Override Me!*/
        translatesAutoresizingMaskIntoConstraints = false
    }
}
