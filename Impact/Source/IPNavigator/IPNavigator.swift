//
//  IPNavigator.swift
//  Impact
//
//  Created by Angel Land on 4/7/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This class represetns the UINavigationController, it
/// allow the programmer has the commond functionality
/// of the UINavigationController but splited in objects
/// and avoiding the tons of refs between components.
/// This componetns is specific for a desing it means
/// that the component has a particulas behavior.
open class IPNavigator: IPViewController {
    /// This var contains all the ref to the pushed views.
    fileprivate var stackHierarchy: ContiguousArray<IPViewController> = []
    
    fileprivate var pushAnimation: IPNavigatorPushAnimation! = nil
    fileprivate var popAnimation: IPNavigatorPopAnimation! = nil
    /// This method will be called just after
    /// the constructor.
    open override func onInit() {
        super.onInit()
        configureComponent()
    }
}

// MARK: - Private methods

fileprivate extension IPNavigator {
    /// This method configures all the component.
    func configureComponent() {
        view.backgroundColor = IPColor.White.getRGB()
    }
}

// MARK: - Public methods

extension IPNavigator {
    /// This method pushes a view in the stack.
    /// - parameter view: The view to push.
    open func push(view viewObject: IPNavigatorView<IPNavigatorBar, IPNavigator>) {
        addChildViewController(viewObject)
        view.addSubview(viewObject.view)
        // Adding the new view.
        stackHierarchy.append(viewObject)
        // Adding a reference to the navigator.
        viewObject.navigator = self
        // If the view is the first one, it has to 
        // delete the previous one.
        guard stackHierarchy.count > 1 else { return }
        // Set the referente to the envolved views.
        pushAnimation = IPNavigatorPushAnimation()
        pushAnimation.set(
            newView: viewObject,
            oldView: stackHierarchy[stackHierarchy.count &- 2]
        )
        // Fire the animation.
        pushAnimation.fire()
    }
    
    /// This method pops a view from the stack.
    open func pop() {
        // If the view is the first one, it has to
        // delete the previous one.
        guard stackHierarchy.count > 1 else { return }
        // Addin the old view.
        addChildViewController(stackHierarchy[stackHierarchy.count &- 2])
        view.insertSubview(
            stackHierarchy[stackHierarchy.count &- 2].view,
            belowSubview: stackHierarchy.last!.view
        )
        // Set the view controller context.
        // For some reason the animation crash when it try to reuse
        // the animation. Fuck this shit.
        popAnimation = IPNavigatorPopAnimation()
        // Adding behavior on complete pop animation.
        // It has to delete the last controller if the animation finishes.
        popAnimation.addCompletion { (position) in
            guard self.stackHierarchy.count != 0 else { return }
            self.stackHierarchy.removeLast()
        }
        popAnimation.set(
            newView: stackHierarchy[stackHierarchy.count &- 2],
            oldView: stackHierarchy[stackHierarchy.count &- 1]
        )
        // Fire the animation!.
        popAnimation.fire()
    }
}
