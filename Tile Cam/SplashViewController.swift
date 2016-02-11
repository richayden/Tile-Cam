//
//  SplashViewController.swift
//  Tile Cam
//
//  Created by Richard Hayden on 2/9/16.
//  Copyright © 2016 richayden. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    var imageView: UIImageView!
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(false)
//        navigationController?.navigationBarHidden = true
//        navigationController?.setToolbarHidden(true, animated: false)
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(
            0.9, target: self, selector: Selector("show"), userInfo: nil, repeats: false
        )
        
        imageView = UIImageView(image: UIImage(named: "shutter"))
        //imageView.center = CGPoint(x: (UIScreen.mainScreen().bounds.size.width), y: (UIScreen.mainScreen().bounds.size.height))
        imageView.frame = CGRectMake((UIScreen.mainScreen().bounds.size.width / 2), (UIScreen.mainScreen().bounds.size.height / 2), (UIScreen.mainScreen().bounds.size.width / 10), (UIScreen.mainScreen().bounds.size.width / 10))
        view.addSubview(imageView)
        
        //CGRectMake((UIScreen.mainScreen().bounds.size.width / 2) - 30, (UIScreen.mainScreen().bounds.size.height) - 80, 60, 60)
        
        UIView.animateWithDuration(0.9 ,
            animations: {
                self.imageView.transform = CGAffineTransformMakeScale(-30, -30)
            },
            completion: { finish in
                UIView.animateWithDuration(0.9){
                    self.imageView.transform = CGAffineTransformMakeScale(80, 80)
                }
        })
        
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
        self.performSegueWithIdentifier("showApp", sender: self)
    }
    
    
}