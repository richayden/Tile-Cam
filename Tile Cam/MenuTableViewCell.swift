//
//  MenuTableViewCell.swift
//  Tile Cam
//
//  Created by Richard Hayden on 2/8/16.
//  Copyright © 2016 richayden. All rights reserved.
//

import UIKit
import FontAwesome_swift

class MenuTableViewCell: UITableViewCell {
    
       
    @IBOutlet weak var fontawesomeLabel: UILabel!
    @IBOutlet weak var titleLabel:UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
