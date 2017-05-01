//
//  IPTabBarNavigation.swift
//  Impact
//
//  Created by Angel Land on 3/19/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This enum contains all the constants for
/// IPTabBarNavigation.
fileprivate enum IPTabBarNavigationConstants {
    static let height: CGFloat = 48
}

/// This protocol handles all the events.
public protocol IPTabBarNavigationHandler: class {
    func onTap(section: IPTabBarNavigationItem)
}

/// This class represents the bottom bar
/// of the IPTabBar component.
open class IPTabBarNavigation<T: IPTabBarNavigationItem>: IPView {
    // This var contains all the items.
    fileprivate let stackView: IPStackView = IPStackView()
    // This var contains the number of items.
    fileprivate var numberOfItems: UInt8 = 0
    // This var contains the reference to the separator bar.
    fileprivate let separatorBar: IPTabBarNavigationSeparatorLine
        = IPTabBarNavigationSeparatorLine()
    // This var constains the refernece to the object
    // which handles the events.
    fileprivate var eventHandler: IPTabBarNavigationHandler! = nil
    
    /// This method will be executed just after the
    /// constructor.
    override open func onInit() {
        super.onInit()
        configureComponent()
        configureConstraints()
    }
    
    /// This method will be exectued after add this
    /// view to the parent.
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        configureConstraintsAfterAddView()
    }
    
    /// This method will be executed when the app
    /// updates all the constraints.
    override open func layoutSubviews() {
        super.layoutSubviews()
        updateComponentsSizes()
    }
}

// MARK: - Private methods

fileprivate extension IPTabBarNavigation {
    /// This method configures all the components.
    func configureComponent() {
        // Setting view
        backgroundColor = IPColor.White.getRGB()
        // Setting the stackview.
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        addSubview(stackView)
        // Setting separator bar.
        separatorBar.set(position: CGPoint(x: 0, y: 0))
        layer.addSublayer(separatorBar)
    }
    
    /// This method configures all the constraints
    /// iside the component.
    func configureConstraints() {
        // Setting the height of the component.
        IPConstraint.height.activate(
            withConstant: IPTabBarNavigationConstants.height,
            andObject: self
        )
        // Setting stack view constraints.
        // Left constraint.
        IPConstraint.left.activate(inContainer: self, withObject: stackView)
        // Right constraint.
        IPConstraint.right.activate(inContainer: self, withObject: stackView)
        // Height constraint.
        IPConstraint.height.activate(
            withConstant: IPTabBarNavigationConstants.height,
            andObject: stackView
        )
        // Bottom constraint.
        IPConstraint.bottom.activate(inContainer: self, withObject: stackView)
    }
    
    /// This method will be exectued just after
    /// add the view to the parent.
    func configureConstraintsAfterAddView() {
        // Adding the left constraint to parent.
        IPConstraint.left.activate(withObjectTarget: self, andObject: superview!)
        // Adding the right constraint to parent.
        IPConstraint.right.activate(withObjectTarget: self, andObject: superview!)
        // Adding the bottom constraint to parent.
        IPConstraint.bottom.activate(withObjectTarget: self, andObject: superview!)
    }
    
    /// This method update all the compoentns inside the class
    /// after update the contraints.
    func updateComponentsSizes() {
        separatorBar.set(width: frame.width)
    }
}

// MARK: - Public methods

public extension IPTabBarNavigation {
    /// This methods sets the object handler.
    /// - parameters
    ///     handler: Object used to handler the events.
    func set(handler: IPTabBarNavigationHandler) { eventHandler = handler }
    
    /// This method adds all the items passed by parameter
    /// to the stack.
    /// - parameters
    ///     items: An array with all the items.
    func add(items itemsObject:[T]) {
        numberOfItems = UInt8(itemsObject.count)
        for item in itemsObject {
            // Set the callback object
            item.set(objectHandler: self)
            // Add the item to the stack view.
            stackView.addArrangedSubview(item)
        }
    }
    
    /// This method adds a new items.
    /// - parameters
    ///     withActiveIcon: Icon used when the state is active.
    ///     andUnactiveIcon: Icon used when the state is unactive.
    func addItem(withActiveIcon activeIcon: UIImage,
                 andUnactiveIcon unactiveIcon: UIImage) {
        let newItem: T = T()
        newItem.set(index: Int8(numberOfItems))
        // Set the icons.
        newItem.set(enableIcon: activeIcon, andDisableIcon: unactiveIcon)
        // Set the callback object
        newItem.set(objectHandler: self)
        // Add the item to the stack view.
        stackView.addArrangedSubview(newItem)
        
        numberOfItems = numberOfItems &+ 1
    }
    
    /// This method hides the separator line.
    func hideSeparatorLine() {
        separatorBar.isHidden = true
    }
    
    /// This method shows the separator line.
    func showSeparatorLine() {
        separatorBar.isHidden = false
    }
}

// MARK: - IPTabBarNavigationItemEventHandler

extension IPTabBarNavigation: IPTabBarNavigationItemEventHandler {
    /// This method will be executed when the user
    /// taps on an item.
    public func onTapEvent(item: IPTabBarNavigationItem) {
        guard let strongHandler = eventHandler else { return }
        strongHandler.onTap(section: item)
    }
}
