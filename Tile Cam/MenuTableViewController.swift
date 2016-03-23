//
//  MenuTableViewController.swift
//  Tile Cam
//
//  Created by Richard Hayden on 2/8/16.
//  Copyright © 2016 richayden. All rights reserved.
//

import UIKit
import FontAwesome_swift
@IBDesignable

class MenuTableViewController: UITableViewController {
    
    @IBOutlet var devView: UIView!
    
    enum UIUserInterfaceIdiom : Int
    {
        case Unspecified
        case Phone
        case Pad
    }
    
    struct ScreenSize
    {
        static let SCREEN_WIDTH         = UIScreen.mainScreen().bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.mainScreen().bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    }
    
    //\u{f25a}
    var iconText = ["\u{f185}", "\u{f021}", "\u{f074} \u{f25a}", "\u{f00a}", "\u{f192}", "\u{f12d}", "\u{f002}", "\u{f03e}"]
        
    var menuItems = ["Torch Light On/Off:", "Toggle Camera:", "Toggle Snap Mode:", "Grout Settings:", "Tile Slider", "Clear:", "Zoom In/Out:", "Save Image:"]
    
    var subtitles = ["Turn the torch on/off.", "Toggle front/back facing cameras.", "Toggle random/touch snap modes.", "Select line width and color.", "Slide to change tile grid size.", "Clear the current tile grid.", "Zoom in/out.", "Save tile image to photo library."]
    var currentItem = "Done"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if DeviceType.IS_IPHONE_4_OR_LESS {
            return
        } else {
        devView.frame = CGRectMake(0, (UIScreen.mainScreen().bounds.size.height) - 70, (UIScreen.mainScreen().bounds.size.width), 70)
        devView.clipsToBounds = true
        
        self.view.addSubview(devView)
        }
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return menuItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MenuTableViewCell
        
        // Configure the cell...
        cell.fontawesomeLabel.text = iconText[indexPath.row]
        
        cell.fontawesomeLabel.textColor = UIColor.whiteColor()
        cell.titleLabel.text = menuItems[indexPath.row]
        cell.titleLabel.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor.whiteColor() : UIColor.whiteColor()
        cell.subtitleLabel.text = subtitles[indexPath.row]
        cell.subtitleLabel.textColor = UIColor.lightTextColor()
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let menuTableViewController = segue.sourceViewController as! MenuTableViewController
        if let selectedIndexPath = menuTableViewController.tableView.indexPathForSelectedRow {
            currentItem = menuItems[selectedIndexPath.row]
        }
    }
    
}