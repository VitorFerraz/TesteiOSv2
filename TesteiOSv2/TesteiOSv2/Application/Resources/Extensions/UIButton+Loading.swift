//
//  UIButton+Loading.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

extension UIButton {
    fileprivate var activityIndicatorTag: Int {
        return 1000
    }
    
    var isLoading: Bool {
        return viewWithTag(activityIndicatorTag) != nil
    }
    
    func startLoading(color: UIColor? = nil) {
        let activityIndicator = UIActivityIndicatorView(style: .white)
        activityIndicator.color = color ?? currentTitleColor
        activityIndicator.hidesWhenStopped = true
        activityIndicator.tag = activityIndicatorTag
        addSubview(activityIndicator)
        activityIndicator.frame = CGRect(x: (bounds.width - activityIndicator.bounds.width) / 2,
                                         y: (bounds.height - activityIndicator.bounds.height) / 2,
                                         width: activityIndicator.bounds.width,
                                         height: activityIndicator.bounds.height)
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        titleLabel?.alpha = 0
        setTitleColor(.clear, for: .normal)
        isUserInteractionEnabled = false
    }
    
    func stopLoading() {
        titleLabel?.alpha = 1
        titleLabel?.isOpaque = false
        setTitleColor(.white, for: .normal)
        guard let activityIndicator = viewWithTag(activityIndicatorTag) else { return }
        activityIndicator.removeFromSuperview()
        isUserInteractionEnabled = true
    }
}
