//
//  IPNavigatorPushAnimation.swift
//  Impact
//
//  Created by Angel Land on 4/13/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/**
 This enum contains all the constants used in the IPNavigatorPushAnimation.
 */
fileprivate enum IPNavigatorPushAnimationConstants {
    static let duration: Double = 0.35
    static let curveType: UIViewAnimationCurve = .easeOut
    static let leftOffsetOldView: CGFloat = -80
    static let shadowColor: CGColor = IPColor.shadow.getRGB().cgColor
    static let shadowOpacity: Float = 1.0
    static let shadowOffset: CGFloat = 5
    static let shadowWidth: CGFloat = 5
}

/**
 This class represtes the push animation, if you want to
 modify it just inherit it or inherit from UIViewPropertyAnimator.
 */
public final class IPNavigatorPushAnimation: UIViewPropertyAnimator {
    /// This var contains the referente to the old
    /// view.
    fileprivate weak var oldViewReference: IPViewController! = nil
    /// This var contains the reference to the new
    /// view.
    fileprivate weak var newViewReference: IPViewController! = nil
    
    init() {
        super.init(
            duration: IPNavigatorPushAnimationConstants.duration,
            timingParameters:
            UICubicTimingParameters(
                animationCurve: IPNavigatorPushAnimationConstants.curveType
            )
        )
        configureComponent()
    }
}

// MARK: - Private methods

fileprivate extension IPNavigatorPushAnimation {
    /**
     This method configures the component. It sets the animation
     and the completion callback.
     */
    func configureComponent() {
        // Setting the animation.
        addAnimations {
            // Setting the final position of the old view.
            self.oldViewReference.view.frame.origin.x =
                IPNavigatorPushAnimationConstants.leftOffsetOldView
            // Setting the final position of the new view.
            self.newViewReference.view.frame.origin.x = 0
        }
        
        // On complete deletes the old view from the render context.
        addCompletion { (position) in
            self.oldViewReference.view.removeFromSuperview()
            self.oldViewReference.removeFromParentViewController()
        }
    }
    
    /**
     This method assure the correct initial animation configuration.
     Sets the correct position of the components and the scale of the
     old view.
     */
    func configureInitialStates() {
        // Setting the initial position of the new view.
        newViewReference.view.frame.origin.x = newViewReference.view.frame.width
        // Setting the initial position of the old view.
        // Making sure that the view has the correct position.
        oldViewReference.view.frame.origin.x = 0
        // Setting the shadow.
        let shadowPath = UIBezierPath(rect: CGRect(
            x: 0,
            y: 0,
            width: IPNavigatorPushAnimationConstants.shadowWidth,
            height: newViewReference.view.frame.height
        ))
        newViewReference.view.layer.shadowColor =
            IPNavigatorPushAnimationConstants.shadowColor
        newViewReference.view.layer.shadowOpacity =
            IPNavigatorPushAnimationConstants.shadowOpacity
        newViewReference.view.layer.shadowRadius =
            IPNavigatorPushAnimationConstants.shadowOffset
        newViewReference.view.layer.shadowPath = shadowPath.cgPath
    }
}

// MARK: - Public methods

extension IPNavigatorPushAnimation {
    /**
     This method sets the reference of the objects to be
     animated.
     */
    open func set(newView newObject: IPViewController,
                  oldView oldObject: IPViewController) {
        oldViewReference = oldObject
        newViewReference = newObject
    }
    
    /**
     This methods starts the animation.
     */
    open func fire() {
        // Check if the objects are seted, if not it has to return
        // in order to avoid make an unnecessary method call.
        guard oldViewReference != nil else { return }
        guard newViewReference != nil else { return }
        // Assure initial states.
        configureInitialStates()
        // Fire the animation!.
        startAnimation()
    }
}
