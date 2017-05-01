//
//  IPCarousel.swift
//  Impact
//
//  Created by Angel Land on 4/15/17.
//  Copyright © 2017 Landoni Angel. All rights reserved.
//

import UIKit

open class IPCarousel: IPView {
    /// This var handles the colletion view.
    fileprivate let collection: UICollectionView = UICollectionView()
    /// This var contains the title of the component.
    fileprivate let titleLabel: IPLabel = IPLabel()
    /// This var contains the body of the component.
    fileprivate let bodyLabel: IPLabel = IPLabel()
    /// This method will be executed just after the
    /// constructor.
    override func onInit() {
        super.onInit()
        configureComponent()
        configureConstraints()
    }
}

// MARK: - Private methods

extension IPCarousel {
    /// This method configures the component.
    fileprivate func configureComponent() {
        // Setting the collection.
        addSubview(collection)
        // Setting labels.
        addSubview(titleLabel)
        addSubview(bodyLabel)
    }
    
    /// This method configures the constraints.
    fileprivate func configureConstraints() {
        // Adding constraints to the carrousel.
        IPConstraint.left.activate(inContainer: self, withObject: collection)
        IPConstraint.right.activate(inContainer: self, withObject: collection)
        IPConstraint.top.activate(inContainer: self, withObject: collection)
        // Adding constraints to the carrousel.
        // Title
        IPConstraint.left.activate(
            withObjectTarget: titleLabel, andObject: self
        )
        IPConstraint.right.activate(
            withObjectTarget: titleLabel, andObject: self
        )
        IPConstraint.top.activate(
            withObjectTarget: titleLabel, andObject: collection
        )
        // Body
        IPConstraint.left.activate(
            withObjectTarget: bodyLabel, andObject: self
        )
        IPConstraint.right.activate(
            withObjectTarget: bodyLabel, andObject: self
        )
        IPConstraint.top.activate(
            withObjectTarget: bodyLabel, andObject: titleLabel
        )
        IPConstraint.bottom.activate(
            withObjectTarget: bodyLabel, andObject: self
        )
    }
}

// MARK: - Public methods

extension IPCarousel {
    
}
