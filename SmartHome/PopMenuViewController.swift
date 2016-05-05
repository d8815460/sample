//
//  PopMenuViewController.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/4/22.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit
import CommonUX

class PopMenuViewController: UIViewController, FlexibleTableViewDelegate {
    let contents = [
        [
            ["All"],
            ["Filter by device type", "lighting and controls", "Doors/Windows", "Damage prevention"]
        ]
    ]
    
    var tableView: FlexibleTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let bananax = view.frame.origin.x
        let bananay = view.frame.origin.y
        let frmae:CGRect = CGRectMake(bananax, bananay, kTGPopMenuWidth, kTGPopMenuHeight)
        
        tableView = FlexibleTableView(frame: frmae, delegate: self)
        tableView.layer.cornerRadius = 5
        
        view.addSubview(tableView)
        
        self.tableView.backgroundColor = DefauleTheme.SubColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return contents.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contents[section].count
    }
    
    func tableView(tableView: UITableView, numberOfSubRowsAtIndexPath indexPath: NSIndexPath) -> Int
    {
        return contents[indexPath.section][indexPath.row].count - 1;
    }
    
    func tableView(tableView: UITableView, shouldExpandSubRowsOfCellAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return false
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = FlexibleTableViewCell(style:.Default, reuseIdentifier:"cell")
        
        cell.backgroundColor = UIColor.clearColor()
        
        cell.textLabel!.text = contents[indexPath.section][indexPath.row][0]
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        if (indexPath.section == 0 && indexPath.row == 1) {
            cell.expandable = true
        } else {
            cell.expandable = false
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, cellForSubRowAtIndexPath indexPath: FlexibleIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.Default, reuseIdentifier:"leftMenuCell")
        cell.backgroundColor=UIColor.groupTableViewBackgroundColor()
        cell.textLabel!.text = contents[indexPath.section][indexPath.row][indexPath.subRow]
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
    
    
    func collapseSubrows() {
        tableView.collapseCurrentlyExpandedIndexPaths()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: FlexibleTableView, didSelectSubRowAtIndexPath indexPath: FlexibleIndexPath) {
        
        let item = indexPath.row
        let subItem = indexPath.subRow
        let center = NSNotificationCenter.defaultCenter()
        switch item {
        case 0:
            center.postNotification(NSNotification(name: kTGPopMenuDidSelectedAll, object: subItem))
        case 1:
            if subItem == 0 {
                center.postNotification(NSNotification(name: kTGPopMenuDidSelectedFilterByDeviceType, object: self))
            } else if subItem == 1 {
                center.postNotification(NSNotification(name: kTGPopMenuDidSelectedLightingAndControls, object: self))
            } else if subItem == 2 {
                center.postNotification(NSNotification(name: kTGPopMenuDidSelectedDoorsAndWindows, object: self))
            } else if subItem == 3 {
                center.postNotification(NSNotification(name: kTGPopMenuDidSelectedDamagePrevention, object: self))
            }
        default:
            print("Unrecognized menu index")
            return
        }
        
        if item != 1 {
            center.postNotificationName("closeMenu", object: nil)
        }
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: FlexibleTableView, didDeselectSubRowAtIndexPath indexPath: FlexibleIndexPath) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
