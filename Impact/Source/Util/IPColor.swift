//
//  Color.swift
//  Impact
//
//  Created by Angel Land on 3/21/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

/// This class contains the basics colors.
enum IPColor: Int {
    case Black = 0x000000
    case White = 0xFFFFFF
    case Gray = 0xAAAAAA
    case shadow = 0x333333
    
    /// This method resturns the color in a UIColor type.
    func getRGB() -> UIColor {
        return UIColor(
            red: CGFloat((self.rawValue >> 16) & 0xFF) / 255,
            green: CGFloat((self.rawValue >> 8) & 0xFF) / 255,
            blue: CGFloat(self.rawValue & 0xFF) / 255,
            alpha: 1.0
        )
    }
}
