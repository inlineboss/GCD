import UIKit

class AnimationIndicator {
    
    weak var indicator: UIActivityIndicatorView!
    
    let queue = DispatchQueue.global(qos: .utility)
    
    init(_ object: UIActivityIndicatorView!){
        indicator = object
    }
    
    func waiting (clouser : @escaping ()->()) {
    
        indicator.isHidden = false
        indicator.startAnimating()
        
        queue.async {
            clouser()
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.indicator.isHidden = true
            }
        }
        

    }
    
}
