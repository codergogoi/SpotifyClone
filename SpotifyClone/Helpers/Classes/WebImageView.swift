//
//  WebImageView.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/1/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


let imgCache = NSCache<AnyObject, AnyObject>()

class WebImageView: UIImageView {

    var imgUrlString: String?
    
    func loadImageWithUrl(urlString: String){
        
        imgUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url : URL = URL(string: urlString)!
        
        image = nil
        
        if let imageFromCache = imgCache.object(forKey: urlString as AnyObject) as? UIImage{
            self.image = imageFromCache
            return
        }
        
        let req = URLRequest(url: url)
 
        let task = URLSession.shared.dataTask(with: req as URLRequest, completionHandler: { data, response, error in

            if error != nil {
                //print("error while loading the image")
                return
            }
            
            DispatchQueue.main.async {
                
                let imgToCache = UIImage(data: data!)
                if let imageCached = imgToCache{
                    imgCache.setObject(imageCached, forKey: urlString as AnyObject)
                    self.image = imgToCache
                }else{
                    return
                }
            }
            
        })
         task.resume()
        
    }

}
