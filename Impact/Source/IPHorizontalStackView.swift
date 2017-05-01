//
//  IPHorizontalStackView.swift
//  Impact
//
//  Created by Angel Land on 4/8/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

open class IPHorizontalStackView: IPStackView {
    /// This method will be exectued just after
    /// the constructor.
    override func onInit() {
        configureComponent()
    }
}

fileprivate extension IPHorizontalStackView {
    /// This method configures all the component.
    func configureComponent() {
        axis = .horizontal
        alignment = .fill
        distribution = .fill
    }
}
