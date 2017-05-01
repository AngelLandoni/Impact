//
//  IPNavigatorPopAnimation.swift
//  Impact
//
//  Created by Angel Land on 4/13/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/**
 This enum contains all the constraints used in the class
 IPNavigatorPopAnimation.
 */
fileprivate enum IPNavigatorPopAnimationConstants {
    static let duration: Double = 0.35
    static let curveType: UIViewAnimationCurve = .easeOut
    static let leftOffsetNewView: CGFloat = -80
    static let shadowColor: CGColor = IPColor.shadow.getRGB().cgColor
    static let shadowOpacity: Float = 1.0
    static let shadowOffset: CGFloat = 5
    static let shadowWidth: CGFloat = 5
    static let shadowLayerColor: UIColor = UIColor(
        red: 0,
        green: 0,
        blue: 0,
        alpha: 0.7
    )
}

/**
 This class represetns the pop animation. It is used in the IPNavigator
 when the user wants to pop the view.
 It is a class that inherite from
 UIViewPropertyAnimator. It is a final class if you want to create a similar
 animation you should create a class that inherited from UIViewPropertyAnimator
 and make the correct configuration.
 */
public final class IPNavigatorPopAnimation: UIViewPropertyAnimator {
    /// This var contains a WEAK reference to the new view.
    fileprivate weak var newViewReference: IPViewController! = nil
    /// This var contains a WEAK reference to the old view.
    fileprivate weak var oldViewReference: IPViewController! = nil
    /// This var contains a reference to the shadow layer.
    fileprivate var shadowLayer: IPView! = nil
    
    init() {
        super.init(
            duration: IPNavigatorPopAnimationConstants.duration,
            timingParameters:
            UICubicTimingParameters(
                animationCurve: IPNavigatorPopAnimationConstants.curveType
            )
        )
        configureComponent()
    }
}

// MARK: - Private methods

fileprivate extension IPNavigatorPopAnimation {
    /**
     This method configures the component
     */
    func configureComponent() {
        // Setting the animation.
        addAnimations {
            // Setting the new view final position.
            self.newViewReference.view.frame.origin.x = 0
            // Setting the old view final position.
            self.oldViewReference.view.frame.origin.x =
                self.oldViewReference.view.frame.size.width +
                IPNavigatorPopAnimationConstants.shadowOffset
            self.shadowLayer.backgroundColor = UIColor.clear
        }
        
        // On complete deletes the old view from the render context.
        addCompletion { (position) in
            guard self.oldViewReference != nil else { return }
            self.oldViewReference.view.removeFromSuperview()
            self.oldViewReference.removeFromParentViewController()
            self.oldViewReference.view.layer.shadowPath = nil
            self.shadowLayer.removeFromSuperview()
            self.shadowLayer = nil
        }
    }
    
    /**
     This method configures the initial states
     of the views, to be sure that the view
     is in the correct initial state.
     */
    func configureInitialStates() {
        // Set the correr position of the new view.
        newViewReference.view.frame.origin.x =
            IPNavigatorPopAnimationConstants.leftOffsetNewView
        // Setting the shadow.
        let shadowPath = UIBezierPath(rect: CGRect(
            x: 0,
            y: 0,
            width: IPNavigatorPopAnimationConstants.shadowWidth,
            height: oldViewReference.view.frame.height
        ))
        oldViewReference.view.layer.shadowColor =
            IPNavigatorPopAnimationConstants.shadowColor
        oldViewReference.view.layer.shadowOpacity =
            IPNavigatorPopAnimationConstants.shadowOpacity
        oldViewReference.view.layer.shadowRadius =
            IPNavigatorPopAnimationConstants.shadowOffset
        oldViewReference.view.layer.shadowPath = shadowPath.cgPath
        // Setting the correct position of the old view.
        oldViewReference.view.frame.origin.x = 0
        // Allow the shadow layer, it has to be this way because
        // for some reason the animation does not has a property
        // to reset itself.
        shadowLayer = IPView()
        // Setting the shadow layer.
        shadowLayer.frame.origin = CGPoint(x: 0, y: 0)
        shadowLayer.frame.size = newViewReference.view.bounds.size
        shadowLayer.backgroundColor =
            IPNavigatorPopAnimationConstants.shadowLayerColor
        // Adding the shadow layer.
        newViewReference.view.addSubview(shadowLayer)
    }
}

// MARK: - Public methods

extension IPNavigatorPopAnimation {
    /**
     This method sets the referentes to the envolved views.
     - parameter newView: The view to be presented.
     - parameter oldView: The view to be replaced.
     */
    open func set(newView newObject: IPViewController,
                  oldView oldObject: IPViewController) {
        newViewReference = newObject
        oldViewReference = oldObject
    }
    
    /**
     This method fire the animation, it depends of the
     animation seted on the configuration. Unless the
     view are not nil it has to return to avoid execute
     an unnecessary method.
     */
    open func fire() {
        // Check the controllers.
        guard oldViewReference != nil else { return }
        guard newViewReference != nil else { return }
        // Assure initial states.
        configureInitialStates()
        // Start the animation.
        startAnimation()
    }
}

