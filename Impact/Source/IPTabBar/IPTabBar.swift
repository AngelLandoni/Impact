//
//  IPTabBar.swift
//  Impact
//
//  Created by Angel Land on 3/19/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This class represent the UITabBarController
/// from a base UIViewController, adding custom
/// controlls and events.
open class IPTabBar<T: IPTabBarNavigation<IPTabBarNavigationItem>>:
                    IPViewController, IPTabBarNavigationHandler {
    // This var contains the reference to the navigation view.
    fileprivate let navigationView: T = T()
    // This var contains all the controllers.
    fileprivate var controllers: [IPViewController] = []
    // This var constans the selected controller index.
    fileprivate var index: Int8 = -1
    
    /// This mehtod will be called just afer the 
    /// constructor, in this case is not neccesary
    /// call the onInit of the super.
    override open func onInit() {
        configureComponent()
    }
    
    // MARK: - IPTabBarNavigationHandler
    // Swift 3.1 does not support override extension methods yet.
    
    /// This method will be executed just after the
    /// user make a tap on a specific item.
    open func onTap(section: IPTabBarNavigationItem) {
        move(toSection: section.getIndex())
    }
}

// MARK: - Private methods

private extension IPTabBar {
    /// This method configures all the components
    /// inside the view.
    func configureComponent() {
        // Setting the navigaiton bar handler.
        navigationView.set(handler: self)
        // Setting the background color of the view.
        view.backgroundColor = IPColor.White.getRGB()
        view.addSubview(navigationView)
    }
}

// MARK: - Public methods

extension IPTabBar {
    /// This method adds a new controller to the array.
    public func add<T: IPViewController>(withType: T.Type) {
        let newController: T = T()
        controllers.append(newController)
    }
    
    /// This methdos adds a controller.
    public func add(view: IPViewController) {
        controllers.append(view)
    }
    
    /// This method adds a new icon.
    public func add(activeIcon: UIImage, unactiveIcon: UIImage) {
        navigationView.addItem(
            withActiveIcon: activeIcon,
            andUnactiveIcon: unactiveIcon
        )
    }

    /// This methdo moves the focus of the tab bar
    /// to a specific controller.
    /// - parameters
    ///     toSection: Index of the section.
    public func move(toSection section: Int8) {
        // Avoid out of index.
        guard Int(section) < controllers.count else { return }
        // Avoid self select
        guard index != section else { return }
        // If some controller is already seted it should
        // delete it.
        if index != -1 {
            controllers[Int(index)].view.removeFromSuperview()
            controllers[Int(index)].removeFromParentViewController()
        }
        index = section
        // Adding the controller.
        addChildViewController(controllers[Int(index)])
        view.insertSubview(
            controllers[Int(index)].view,
            belowSubview: navigationView
        )
    }
}
