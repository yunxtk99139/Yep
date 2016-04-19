//
//  IconTitleContainerView.swift
//  Yep
//
//  Created by NIX on 16/4/19.
//  Copyright © 2016年 Catch Inc. All rights reserved.
//

import UIKit

class IconTitleContainerView: UIView {

    var tapAction: (() -> Void)?
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_pin_shadow")
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGrayColor()
        label.font = UIFont.systemFontOfSize(15)
        return label
    }()

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        makeUI()

        let tap = UITapGestureRecognizer(target: self, action: #selector(IconTitleContainerView.tap(_:)))
        addGestureRecognizer(tap)
    }

    private func makeUI() {

        addSubview(iconImageView)
        addSubview(titleLabel)

        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let views = [
            "iconImageView": iconImageView,
            "titleLabel": titleLabel,
        ]

        let constraintsH = NSLayoutConstraint.constraintsWithVisualFormat("H:|[iconImageView]-5-[titleLabel]|", options: [.AlignAllCenterY], metrics: nil, views: views)
        let constraintsV = NSLayoutConstraint.constraintsWithVisualFormat("V:|[iconImageView]|", options: [], metrics: nil, views: views)

        NSLayoutConstraint.activateConstraints(constraintsH)
        NSLayoutConstraint.activateConstraints(constraintsV)
    }

    @objc private func tap(sender: UITapGestureRecognizer) {
        tapAction?()
    }
}
