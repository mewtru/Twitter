//
//  ImageLoader.swift
//  Twitter
//
//  Created by Mewtru on 9/23/20.
//

import Foundation
import UIKit

struct ImageLoader {
    
    static let shared = ImageLoader()
    
    func loadImage(at url: URL, completion: @escaping (URL, UIImage) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Didn't get any data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    completion(url, image)
                }
            }
        }
        
        dataTask.resume()
    }
}
