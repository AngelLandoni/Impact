//
//  IPNavigatorView.swift
//  Impact
//
//  Created by Angel Land on 4/7/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This class represetns the view that is allowed to be pushed
/// in the IPNavigator.
open class IPNavigatorView<T: IPNavigatorBar, R: IPNavigator>: IPViewController {
    /// This var contains the reference to the navigator bar.
    fileprivate let navigatorBar: T = T()
    /// A weak reference to the super navigator.
    fileprivate weak var navigatorRef: R! = nil
    /// This methor will be executed just after the constructor.
    open override func onInit() {
        super.onInit()
        configureComponent()
    }
}

// MARK: - Private method

fileprivate extension IPNavigatorView {
    /// This methdos configures all the component.
    func configureComponent() {
        view.backgroundColor = IPColor.White.getRGB()
        // Adding the navigation bar.
        view.addSubview(navigatorBar)
    }
}

// MARK: - Public method

extension IPNavigatorView {
    /// This method returns the navigation bar reference
    /// - warning: It is a reference, if you get it you are increasing the count.
    /// - return T: Returns the correct navigator bar.
    public func getNavigationBar() -> T { return navigatorBar }
    
    /// This method adds a new ivew.
    /// - parameters: View: View to add to the stack.
    public func addSubview(view viewObject: IPView) {
        // Insert subview below the navigator.
        view.insertSubview(viewObject, belowSubview: navigatorBar)
    }
}

// MARK: - Getters and Setters 

extension IPNavigatorView {
    /// This getter and setter sets the reference 
    /// to the navigator.
    open var navigator: R {
        get { return navigatorRef }
        set { navigatorRef = newValue }
    }
}
