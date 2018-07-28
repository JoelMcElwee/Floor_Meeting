//
//  Extensions.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 5/29/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadImageUsingCacheWithUrlString(urlString: String) {
        
        self.image = nil
        
        //Check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
            self.image = cachedImage
            return
        }
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            // Download hit an error so lets return out
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    self.image = downloadedImage
                }
                
                self.image = UIImage(data: data!)
            }
            
            }.resume()
    }
}
