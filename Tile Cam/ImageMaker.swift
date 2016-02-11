//
//  ImageMaker.swift
//  Tile Cam
//
//  Created by Richard Hayden on 2/1/16.
//  Copyright © 2016 richayden. All rights reserved.
//

import UIKit

extension UIView {
    
    func capture() -> UIImage {
                
        //UIGraphicsBeginImageContextWithOptions(CGSizeMake(1224, 1224), false, 0.0)
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(UIScreen.mainScreen().bounds.size.width * 3, UIScreen.mainScreen().bounds.size.width * 3), false, UIScreen.mainScreen().scale)
        
        
        //UIGraphicsBeginImageContextWithOptions(CGSize(width: 1224, height: 1224), false, 0)
        
        self.layer.drawInContext(UIGraphicsGetCurrentContext()!)
        
        drawViewHierarchyInRect(CGRectMake(0, -44 * 3, bounds.size.width * 3, bounds.size.height * 3), afterScreenUpdates: true)
        
        //drawViewHierarchyInRect(CGRectMake(0, -176, 1224, 2448), afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        
        //UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
        return image

    }
    
}
