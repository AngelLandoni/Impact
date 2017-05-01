//
//  Constraints.swift
//  Impact
//
//  Created by Angel Land on 3/19/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This enum handles the contraints in a easy
/// way. It is no so flexible if you want a more
/// fexible way to add constraints you should
/// considerate use the default constraint system.
public enum IPConstraint {
    case center
    case centerX
    case height
    case width
    case left
    case right
    case top
    case bottom
    case fill
    
    /// This method center the object in the container view.
    /// - parameters
    ///     inContainer: the object which contains the view
    ///     withObject: the object to center.
    public func activate(inContainer container: UIView, withObject target: UIView) {
        switch self {
        case .center:
            activateCenterConstraint(container: container, target: target)
        case .centerX:
            activateCenterXConstraint(container: container, target: target)
        case .left:
            activateLeftConstraint(object: container, target: target)
        case .right:
            activateRightConstraint(object: container, target: target)
        case .top:
            activateTopConstraint(object: container, target: target)
        case .bottom:
            activateBottomConstraint(object: container, target: target)
        case .fill:
            activateFillConstraint(container: container, target: target)
        default:
            fatalError(IPFatalError.constraintTypeUnsupported)
        }
    }
    
    /// This method center the object in the container view.
    /// - parameters
    ///     inContainer: the object which contains the view
    ///     withObject: the object to center.
    public func activate(inContainer container: UIView,
                  withObject target: UIView, andConstant constant: CGFloat) {
        switch self {
        case .left:
            activateLeftConstraintWithConstant(object: container,
                                               target: target,
                                               constant: constant)
        case .right:
            activateRightConstraintWithConstant(object: container,
                                               target: target,
                                               constant: constant)
        default:
            fatalError(IPFatalError.constraintTypeUnsupported)
        }
    }
    
    /// This method set a fixed constraint.
    /// - parameters
    ///     withConstant: the static value.
    ///     andObject: the object to apply the constaint.
    public func activate(withConstant value: CGFloat, andObject target: UIView) {
        switch self {
        case .height:
            activateHeightConstraint(value: value, target: target)
        case .width:
            activateWidthConstraint(value: value, target: target)
        default:
            fatalError(IPFatalError.constraintTypeUnsupported)
        }
    }
    
    /// This method set a fixed constraint.
    /// - parameters
    ///     withConstant: the static value.
    ///     andObject: the object to apply the constaint.
    public func activate(withObjectTarget objectTarget: UIView,
                         andObject object: UIView) {
        switch self {
        case .left:
            activateLeftConstraint(object: objectTarget, target: object)
        case .right:
            activateRightConstraint(object: objectTarget, target: object)
        case .top:
            activateTopConstraint(object: objectTarget, target: object)
        case .bottom:
            activateBottomConstraint(object: objectTarget, target: object)
        default:
            fatalError(IPFatalError.constraintTypeUnsupported)
        }
    }
}

// MARK: - Static methods

/// This method centers the object in the center
/// of the container view usin constraints.
/// - parameters
///     container: The view which contains the object
///     target: The object to center.
fileprivate func activateCenterXConstraint(container: UIView, target: UIView) {
    NSLayoutConstraint.activate([
        target.centerXAnchor.constraint(equalTo: container.centerXAnchor)
    ])
}

/// This method centers the object in the center
/// of the container view usin constraints.
/// - parameters
///     container: The view which contains the object
///     target: The object to center.
fileprivate func activateCenterConstraint(container: UIView, target: UIView) {
    NSLayoutConstraint.activate([
        target.centerXAnchor.constraint(equalTo: container.centerXAnchor),
        target.centerYAnchor.constraint(equalTo: container.centerYAnchor)
    ])
}

/// This method sets a fixed height constraint.
/// - parameters
///     value: The constant value.
///     target: The view to add the constraint.
fileprivate func activateHeightConstraint(value: CGFloat, target: UIView) {
    NSLayoutConstraint.activate([
        target.heightAnchor.constraint(equalToConstant: value)
    ])
}

/// This method sets a fixed width constraint.
/// - paramteres
///     value: The constant value.
///     target: The view to add the constraint.
fileprivate func activateWidthConstraint(value: CGFloat, target: UIView) {
    NSLayoutConstraint.activate([
        target.widthAnchor.constraint(equalToConstant: value)
    ])
}

/// This method sets a fixed left constraint.
/// - paramteres
///     value: The object to attach.
///     target: The view to add the constraint.
fileprivate func activateLeftConstraint(object: UIView, target: UIView) {
    NSLayoutConstraint.activate([
        target.leftAnchor.constraint(equalTo: object.leftAnchor)
    ])
}

/// This method sets a fixed right constraint.
/// - paramteres
///     value: The object to attach.
///     target: The view to add the constraint.
fileprivate func activateRightConstraint(object: UIView, target: UIView) {
    NSLayoutConstraint.activate([
        target.rightAnchor.constraint(equalTo: object.rightAnchor)
    ])
}

/// This method sets a fixed top constraint.
/// - paramteres
///     value: The object to attach.
///     target: The view to add the constraint.
fileprivate func activateBottomConstraint(object: UIView, target: UIView) {
    NSLayoutConstraint.activate([
        target.bottomAnchor.constraint(equalTo: object.bottomAnchor)
    ])
}

/// This method sets a fixed bottom constraint.
/// - paramteres
///     value: The object to attach.
///     target: The view to add the constraint.
fileprivate func activateTopConstraint(object: UIView, target: UIView) {
    NSLayoutConstraint.activate([
        target.topAnchor.constraint(equalTo: object.topAnchor)
    ])
}

/// This method sets a fixed left constraint with a constant.
/// - paramteres
///     value: The object to attach.
///     target: The view to add the constraint.
///     constant: The contant of the constraint.
fileprivate func activateLeftConstraintWithConstant(object: UIView,
                                                    target: UIView,
                                                    constant: CGFloat) {
    NSLayoutConstraint.activate([
        target.leftAnchor.constraint(equalTo: object.leftAnchor, constant: constant)
    ])
}

/// This method sets a fixed left constraint with a constant.
/// - paramteres
///     value: The object to attach.
///     target: The view to add the constraint.
///     constant: The contant of the constraint.
fileprivate func activateRightConstraintWithConstant(object: UIView,
                                                    target: UIView,
                                                    constant: CGFloat) {
    NSLayoutConstraint.activate([
        target.rightAnchor.constraint(equalTo: object.rightAnchor, constant: constant)
    ])
}

/// This method sets a fixed left constraint with a constant.
/// - paramteres
///     value: The object to attach.
///     target: The view to add the constraint.
///     constant: The contant of the constraint.
fileprivate func activateFillConstraint(container: UIView,
                                        target: UIView)  {
    NSLayoutConstraint.activate([
        target.leftAnchor.constraint(equalTo: container.leftAnchor),
        target.rightAnchor.constraint(equalTo: container.rightAnchor),
        target.topAnchor.constraint(equalTo: container.topAnchor),
        target.bottomAnchor.constraint(equalTo: container.bottomAnchor)
    ])
}
