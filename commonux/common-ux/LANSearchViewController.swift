//
//  LANSearchViewController.swift
//  CommonUX
//
//  Created by David Lin on 3/28/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit

public class LANSearchViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak private var tableView: UITableView!;
    
    private var resultCallback: ((error: NSError?, result: LANSearchResult?) -> Void)?;
    private var searchResult: [LANSearchResult] = [];

    // MARK: - UITableViewDataSource
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count;
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return getViewForCellAtRow(tableView, row: indexPath.row, withLANSearchResult: searchResult[indexPath.row]);
    }
    
    // MARK: - UITableViewDelegate
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        resultCallback?(error: nil, result: searchResult[indexPath.row]);
        
        print("did select \(indexPath.row)")
        showProgress(NSLocalizedString("Registering...", comment: "LAN Search Progress"));
        if indexPath.row < 3 {
            delay(3, closure: {
                self.hideProgress()
                //轉場至Step2 (2-6)
                self.performSegueWithIdentifier("2-6", sender: nil)
            })
        } else {
            delay(3, closure: {
                self.hideProgress()
                //轉場至timeout(2-7)
                self.performSegueWithIdentifier("timeout", sender: nil)
            })
        }
        
        self.navigationController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
    }
    
    // MARK: - Can be overriden by sub-class
    
    public func getViewForCellAtRow(tableView: UITableView, row: NSInteger, withLANSearchResult result: LANSearchResult) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = result.uid!;
        return cell;
    }
    
    // MARK: - Public exposed functions, can be called by sub-class
    
    public func cancel() {
        resultCallback?(error: nil, result: nil);
        self.navigationController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
    }
    
    public func reload(withProgress: Bool, completionHandler: ((Void) -> Void)?) {
        // XXX(YC): Faking LAN Search here
        self.searchResult.removeAll();
        self.tableView.reloadData();

        if withProgress {
            showProgress(NSLocalizedString("LAN Searching...", comment: "LAN Search Progress"));
        }
        delay(3) {
            dispatch_async(dispatch_get_main_queue()) {
                if withProgress {
                    self.hideProgress();
                }
                
                for i in 0...5 {
                    if i == 5 {
                        self.searchResult.append(LANSearchResult(uid: "TEST TIME OUT HERE  \(i)", ipv4: "127.0.0.1", ipv6: nil, name: "Result \(i)"))
                    } else {
                        self.searchResult.append(LANSearchResult(uid: "XXXXXXXXXXXXXXXXXXX\(i)", ipv4: "127.0.0.1", ipv6: nil, name: "Result \(i)"))
                    }
                }
                self.tableView.reloadData();
                completionHandler?();
            }
        }
    }
    
    public static func launchForResult(via via: UIViewController, cb: ((error: NSError?, result: LANSearchResult?) -> Void)?) {
        let vc = getLANSearchViewControllerInstance();
        vc.resultCallback = cb;
        let nvc = UINavigationController(rootViewController: vc);
        via.presentViewController(nvc, animated: true, completion: nil);
    }
    
    public class func getLANSearchViewControllerInstance() -> LANSearchViewController {
        let bundle = NSBundle(forClass: LANSearchViewController.self);
        return LANSearchViewController(nibName: "LANSearchViewController", bundle: bundle);
    }

    // MARK: - Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad();
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(LANSearchViewController.cancel));
        self.navigationItem.title = NSLocalizedString("ADD", comment: "Lan Search Title");
        
        self.reload(true, completionHandler: nil);
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
 
}

