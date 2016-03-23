//
//  SplashViewController.swift
//  Tile Cam
//
//  Created by Richard Hayden on 2/9/16.
//  Copyright © 2016 richayden. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet var splashView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = true
        navigationController?.setToolbarHidden(true, animated: false)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let timer = NSTimer.scheduledTimerWithTimeInterval(
            1.1, target: self, selector: #selector(SplashViewController.show), userInfo: nil, repeats: false)
        dispatch_async(dispatch_get_main_queue()) {
            self.splashView.addTileCamSplashAnimationCompletionBlock { (finished) -> Void in
                print("Animated")
            }
        }
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