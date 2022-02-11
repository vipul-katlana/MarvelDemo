//
//  ImageCacheLoader.swift
//  OpenBankMarvelDemo
//
//  Created by Vipul  on 10/02/22.
//

import Foundation
import UIKit
let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    /// Download image from url and disply to imageview
    /// - Parameters:
    ///   - URLString: thumbnail url
    ///   - placeHolder: placeholder default image
    func imageFromServerURL(_ URLString: String, placeHolder: UIImage?) {
        self.image = placeHolder
        if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
            self.image = cachedImage
            return
        }
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil {
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
