//
//  IPTabBarNavigationItem.swift
//  Impact
//
//  Created by Angel Land on 3/19/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This enum contains all the constants used
/// on the IPTabBarNavigationItem.
fileprivate enum IPTabBarNavigationItemConstants {
    static let size: CGSize = CGSize(width: 22, height: 22)
}

/// This protocol allow the object handles all the events.
public protocol IPTabBarNavigationItemEventHandler: class {
    func onTapEvent(item: IPTabBarNavigationItem)
}

/// This class represents the item used in the
/// IPTabBarnavigation.
open class IPTabBarNavigationItem: IPView {
    // This var contains a ref to the icon in memory.
    // Active and unactive.
    fileprivate let activeIcon: IPImageView = IPImageView()
    fileprivate let unactiveIcon: IPImageView = IPImageView()
    // State of the component (Active or unactive).
    fileprivate var state: Bool = false
    // Index of the item.
    fileprivate var index: Int8 = -1
    // Tap gesture handler.
    fileprivate var tapHandler: UITapGestureRecognizer! = nil
    // This is a ref to the object handler.
    // TODO: Avoid this ugly thing using Generics.
    fileprivate var objectHandler: IPTabBarNavigationItemEventHandler! = nil
    
    /// This method will be called just after
    /// the object constructor.
    override func onInit() {
        super.onInit()
        configureComponent()
        configureGestures()
    }
}

// MARK: - Private methods

fileprivate extension IPTabBarNavigationItem {
    /// This method configure all the component.
    func configureComponent() {
        // This line adds the icon to the super view.
        addSubview(activeIcon)
        addSubview(unactiveIcon)
        // Center the icon in the middle of the screen
        // and add the size.
        IPConstraint.center.activate(inContainer: self, withObject: activeIcon)
        IPConstraint.center.activate(inContainer: self, withObject: unactiveIcon)
        IPConstraint.width.activate(
            withConstant: IPTabBarNavigationItemConstants.size.width,
            andObject: unactiveIcon
        )
        IPConstraint.height.activate(
            withConstant: IPTabBarNavigationItemConstants.size.height,
            andObject: unactiveIcon
        )
        // Change the state of the active icon.
        // By default the state is disable.
        activeIcon.isHidden = true
    }
    
    /// This method configures all the gestures in 
    /// the item.
    func configureGestures() {
        // Create the tap gesture.
        tapHandler = UITapGestureRecognizer(
            target: self,
            action: #selector(IPTabBarNavigationItem.onTap(_:))
        )
        // Add the tap gesture.
        addGestureRecognizer(tapHandler)
    }
    
    /// This method swaps between the active and
    /// unactive icon.
    func changeState() {
        activeIcon.isHidden = !state
        unactiveIcon.isHidden = state
    }
}

// MARK: - Public methods

public extension IPTabBarNavigationItem {
    /// This method sets the enable and disable icons.
    /// - parameters:
    ///     enableIcon: Icon used when the item is enabled.
    ///     andDisableIcon: Icon used when the item is disabled.
    func set(enableIcon enable: UIImage, andDisableIcon disable: UIImage) {
        activeIcon.image = enable
        unactiveIcon.image = disable
    }
    
    /// This method sets the object handler
    /// - parameters
    ///     objectHandler: This object will receive all the events.
    func set(objectHandler object: IPTabBarNavigationItemEventHandler) {
        objectHandler = object
    }
    
    /// This methods sets the index of the object
    /// It is necessary to identify the object.
    /// - parameters
    ///     index: Index of the object (It should be unique).
    func set(index indexInView: Int8) {
        index = indexInView
    }
    
    /// This methdos returns the index of the object.
    func getIndex() -> Int8 { return index }
}

// MARK: - Events

extension IPTabBarNavigationItem {
    /// This method will be called each time that
    /// the user thouches the view.
    /// Override it to handle event ;).
    func onTap(_ sender: UITapGestureRecognizer) {
        /* Override Me! */
        guard let strongHandler = objectHandler else { return }
        strongHandler.onTapEvent(item: self)
    }
}

// MARK: - Getters and setters

extension IPTabBarNavigationItem {
    /// This property sets the state of the 
    /// component (Active or unactive).
    var enable: Bool {
        get { return state }
        set(value) {
            state = value
            changeState()
        }
    }
}
