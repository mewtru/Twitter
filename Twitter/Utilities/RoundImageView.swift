//
//  RoundImageView.swift
//  Twitter
//
//  Created by Mewtru on 9/23/20.
//

import UIKit

class RoundImageView: UIImageView {
    
    var url: URL? {
        didSet {
            if url != oldValue {
                loadURL()
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
    
    private func loadURL() {
        if let url = url {
            ImageLoader.shared.loadImage(at: url) { url, image in
                if url == self.url {
                    self.image = image
                }
            }
        } else {
            image = nil
        }
    }
}
