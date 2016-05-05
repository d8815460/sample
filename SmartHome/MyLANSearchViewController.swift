//
//  MyLANSearchViewController.swift
//  SmartHome
//
//  Created by David Lin on 3/28/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit
import CommonUX

class MyLANSearchViewController: LANSearchViewController {
    
    func reload() {
        reload(true, completionHandler: nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reload", style: .Plain, target: self, action: #selector(UIWebView.reload))
    }

    override func getViewForCellAtRow(tableView: UITableView, row: NSInteger, withLANSearchResult result: LANSearchResult) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!;
        let titleLabel = cell.viewWithTag(1) as! UILabel;
        let detailLabel = cell.viewWithTag(2) as! UILabel;
        titleLabel.text = result.name;
        detailLabel.text = result.ipv4;
        return cell;
    }
    
    override class func getLANSearchViewControllerInstance() -> LANSearchViewController {
        let sb = UIStoryboard(name: "MyLANSearchViewController", bundle: nil);
        return sb.instantiateInitialViewController() as! LANSearchViewController;
    }
}
