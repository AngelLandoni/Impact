//
//  IPArrow.swift
//  Impact
//
//  Created by Angel Land on 4/9/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/*
 This enum contains all the constants used in 
 IPArrow.
 */
fileprivate enum IPArrowConstants {
    static let size: CGSize = CGSize(width: 10, height: 20)
    static let lineWidth: CGFloat = 2
    static let color: UIColor = IPColor.Black.getRGB()
}

/*
 IPArrow:
 This class represetns the arrow icon.
 */
final class IPArrow: CAShapeLayer {
    /// This constructor needs the size of the
    /// component.
    init(size: CGSize) {
        super.init()
        configureComponent(withSize: size)
    }
    
    override init() {
        super.init()
        configureComponent(withSize: IPArrowConstants.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureComponent(withSize: IPArrowConstants.size)
    }
}

// MARK: - Private methods

extension IPArrow {
    /// This method configures all the component.
    fileprivate func configureComponent(withSize size: CGSize) {
        frame.size = size
        // It has to rasterize the final render.
        shouldRasterize = true
        // Creating the path.
        let pathArrow: UIBezierPath = UIBezierPath()
        pathArrow.move(to: CGPoint(x: size.width, y: 0))
        pathArrow.addLine(to: CGPoint(x: 0, y: size.height / 2))
        pathArrow.addLine(to: CGPoint(x: size.width, y: size.height))
        path = pathArrow.cgPath
        // Setting the arrow.
        lineWidth = IPArrowConstants.lineWidth
        strokeColor = IPArrowConstants.color.cgColor
        fillColor = UIColor.clear.cgColor
        lineJoin = "round"
        rasterizationScale = UIScreen.main.scale
        opacity = 1.0
    }
}
