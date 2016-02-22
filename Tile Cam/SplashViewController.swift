//
//  SplashViewController.swift
//  Tile Cam
//
//  Created by Richard Hayden on 2/9/16.
//  Copyright © 2016 richayden. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    //var imageView: UIImageView!
    
    @IBOutlet var splashView: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(
            1.25, target: self, selector: Selector("show"), userInfo: nil, repeats: false
        )
        //dispatch_async(dispatch_get_main_queue()) {
        splashView.addTileCamSplashAnimationCompletionBlock { (finished) -> Void in
            print("Animated")
        }
        //}
        navigationController?.navigationBarHidden = true
        navigationController?.setToolbarHidden(true, animated: false)
            
    }
    
    override func viewWillDisappear(animated: Bool) {
        navigationController?.navigationBarHidden = false
        navigationController?.setToolbarHidden(false, animated: false)
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func show() {
        dispatch_async(dispatch_get_main_queue()) {
            self.performSegueWithIdentifier("showApp", sender: self)
        }
    }
}

//extension UIImageView {
//    func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
//        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
//        rotateAnimation.fromValue = 0.0
//        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
//        rotateAnimation.duration = duration
//        
//        if let delegate: AnyObject = completionDelegate {
//            rotateAnimation.delegate = delegate
//        }
//        self.layer.addAnimation(rotateAnimation, forKey: nil)
//    }
//}