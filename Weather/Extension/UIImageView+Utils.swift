//
//  UIImageView+Utils.swift
//  Weather
//
//  Created by Akshita Patel on 09/22/23.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadIconWithName(name: String) {
        var url = "https://openweathermap.org/img/wn/"
        url.append(name + ".png")
        self.loadImageUsingCache(withUrl: url)
    }
    
    func loadImageUsingCache(withUrl urlString : String) {
        guard let url = URL(string: urlString) else {return}
        self.image = nil
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .medium)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                return
            }
            DispatchQueue.main.async {
                guard let imageData = data else {return}
                if let image = UIImage(data: imageData) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    activityIndicator.removeFromSuperview()
                }
            }
        }).resume()
    }
}
