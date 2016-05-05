//
//  FlexibleMenuViewController.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/4/18.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit
import CommonUX

class FlexibleMenuViewController: UIViewController, FlexibleTableViewDelegate {
    let contents = [
        [
            ["IP Hubs", "IP Hub_1","IP Hub_2", "IP Hub_3"],
            ["IP Camera"],
            ["Account"],
            ["Help"],
            ["About"]
        ]
    ]
    
    var tableView: FlexibleTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bananax = view.frame.origin.x
        let bananay = view.frame.origin.y
        let bananaW = view.frame.width-60
        let bananaH = view.frame.height
        let frmae:CGRect = CGRectMake(bananax, bananay, bananaW, bananaH)
        
        tableView = FlexibleTableView(frame: frmae, delegate: self)
        view.addSubview(tableView)
        
        let inset = UIEdgeInsetsMake(64, 0, 0, 0)
        self.tableView.contentInset = inset
        
        let logo: UIImageView = UIImageView(image: UIImage(named: "ic_sm_logo"))
        logo.frame = CGRectMake(90, -40, 90, 30)
        self.tableView.addSubview(logo)
        self.tableView.backgroundColor = DefauleTheme.MainColor
        
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
        if (indexPath.section == 1 && indexPath.row == 0){
            return true
        }
        
        return false
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = FlexibleTableViewCell(style:.Default, reuseIdentifier:"cell")
        
        cell.backgroundColor = UIColor.clearColor()
        
        cell.textLabel!.text = contents[indexPath.section][indexPath.row][0]
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        if (indexPath.section == 0 && indexPath.row == 0) {
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
            if subItem != 0 {
                center.postNotification(NSNotification(name: kTGLeftMenuDidSelectedIPHubs, object: subItem))
            } else {
                return
            }
        case 1:
            center.postNotification(NSNotification(name: kTGLeftMenuDidSelectedCamera, object: self))
        case 2:
            center.postNotification(NSNotification(name: kTGLeftMenuDidSelectedAccount, object: self))
        case 3:
            center.postNotification(NSNotification(name: kTGLeftMenuDidSelectedHelp, object: self))
        case 4:
            center.postNotification(NSNotification(name: kTGLeftMenuDidSelectedAbout, object: self))
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
}
