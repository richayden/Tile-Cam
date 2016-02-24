//
//  MenuTableViewController.swift
//  Tile Cam
//
//  Created by Richard Hayden on 2/8/16.
//  Copyright © 2016 richayden. All rights reserved.
//

import UIKit
import FontAwesome_swift

class MenuTableViewController: UITableViewController {
    
    var iconText = ["\u{f185}", "\u{f021}", "\u{f00a}", "\u{f059}", "\u{f192}", "\u{f12d}", "\u{f002}", "\u{f03e}"]
        
    var menuItems = ["Torch Light On/Off:", "Toggle Camera:", "Grout Settings:", "Help:", "Grid Sizer", "Clear:", "Zoom In/Out:", "Save Image:"]
    
    var subtitles = ["Turn the torch on/off in low light situations or to vary light of captured tiles.", "Toggle between front and back facing cameras.", "Add grout to your tiles. Select color and line width.", "You are here.", "Slide to change tile grid size.", "Clears the current tile grid.", "Zooms the camera in/out.", "Save tile image to photo library."]
    var currentItem = "Done"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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