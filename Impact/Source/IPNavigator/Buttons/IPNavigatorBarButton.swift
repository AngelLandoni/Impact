//
//  IPNavigatorBarButton.swift
//  Impact
//
//  Created by Angel Land on 4/9/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

public typealias BackButtonCallback = () -> Void

class IPNavigatorBarButton: IPView {
    /// This var handles the tap event.
    fileprivate var tapGesture: UITapGestureRecognizer! = nil
    /// This var contains the reference to the callback.
    fileprivate var clickEvent: BackButtonCallback! = nil
    /// This method will be executed just after the constructor.
    override func onInit() {
        super.onInit()
        configureComponent()
    }
    /// This method handles the tap on the back button.
    func onTap() { clickEvent() }
}

// MARK: - Private methods

extension IPNavigatorBarButton {
    
    fileprivate func configureComponent() {
        tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(onTap)
        )
        addGestureRecognizer(tapGesture)
    }
}

// MARK: - Public methods

extension IPNavigatorBarButton {
    /// This method sets the callback used when the
    /// component get a touch.
    open var onClick: BackButtonCallback {
        get { return clickEvent }
        set { clickEvent = newValue }
    }
}
