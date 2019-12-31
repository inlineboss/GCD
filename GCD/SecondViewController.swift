//
//  SecondViewController.swift
//  GCD
//
//  Created by inlineboss on 31.12.2019.
//  Copyright © 2019 inlineboss. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var animationManager : AnimationIndicator!
    
    fileprivate var remouteImageURL : URL?
    var remouteImage : UIImage? {
        set {
            DispatchQueue.main.async {
                self.imageView.image = newValue
                self.imageView.sizeToFit()
            }
        }
        get {
            return imageView.image
        }
    }
    
    var url : String?
        
    var default_url = "https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947_1280.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationManager = AnimationIndicator(indicator)
        
        animationManager.waiting {
            self.fetchImage()
        }

    }
        
    fileprivate func fetchImage() {
        
        remouteImageURL = URL(string: url ?? default_url )
        
        guard
            let image = remouteImageURL,
            let imageData = try? Data(contentsOf: image)
        else { return }
        
        remouteImage = UIImage(data: imageData)
    }

}
