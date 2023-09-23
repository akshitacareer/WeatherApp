//
//  UIViewController+ActivityIndicator.swift
//  Weather
//
//  Created by Akshita Patel on 09/22/23.
//

import Foundation
import UIKit

let activityIndicator = UIActivityIndicatorView.init(style: .large)

extension UIViewController {
    
    func startActivityIndicator() {
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.view.center
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
