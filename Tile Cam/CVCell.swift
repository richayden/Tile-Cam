//
//  CVCell.swift
//  Tile Cam
//
//  Created by Richard Hayden on 1/5/16.
//  Copyright © 2016 richayden. All rights reserved.
//

import UIKit



@objc protocol CustomCollectionViewCellDelegate : NSObjectProtocol {
    func doSnap(sender: AnyObject!)
    //func cellSnap(cell: CVCell!)
}


class CVCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var delegate:CustomCollectionViewCellDelegate?
    
    //var tapped: ((CVCell) -> Void)?
   
    //var snapper: UIButton!
    
    var shutter: UIImageView!
    
//    var croppedImageView: UIImageView!
//    
//    func setImage(image: UIImage) {
//        
//        croppedImageView.image = image
//    }
    
    var label: UILabel!
    
        override init(frame: CGRect) {
            super.init(frame: frame)
    
            
//            self.backgroundColor = UIColor.clearColor()
//            self.layer.borderColor = UIColor.lightGrayColor().CGColor
//            self.layer.borderWidth = 0.5
            //self.layer.cornerRadius = 20
//            let textFrame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
//            label = UILabel(frame: textFrame)
//            label.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
//            label.textAlignment = .Center
//            contentView.addSubview(label)
            
            shutter = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height).insetBy(dx: 5, dy: 5))
            shutter.contentMode = UIViewContentMode.ScaleAspectFill
            shutter.image = UIImage(named: "shutter")
//            shutter.image = shutter.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
//            shutter.tintColor = UIColor.redColor()
            
            shutter.alpha = 0.1
                        
            let recognizer = UITapGestureRecognizer(target: self, action:Selector("shutterTap:"))
            recognizer.delegate = self
            recognizer.numberOfTapsRequired = 1
            self.addGestureRecognizer(recognizer)
            shutter.addGestureRecognizer(recognizer)
            self.userInteractionEnabled = true
            
            //contentView.addSubview(shutter)
    }
    
        
    func shutterTap (recognizer: UITapGestureRecognizer) {
        //print("tap")
        if let delegate_ = self.delegate {
            delegate_.doSnap(self)
            delegate_.doSnap(shutter)
        }
    }
    
    

}
