//
//  GlassesView.swift
//  Tile Cam
//
//  Created by Richard Hayden on 3/16/16.
//  Copyright © 2016 richayden. All rights reserved.
//

import UIKit

class GlassesView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        GlassesStyleKit.drawGlasses()
    }
    

}
