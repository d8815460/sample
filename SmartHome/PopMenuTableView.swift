//
//  PopMenuTableView.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/4/22.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit
import CommonUX

@objc public protocol POPFlexibleTableViewDelegate: NSObjectProtocol {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(tableView: UITableView, numberOfSubRowsAtIndexPath indexPath: NSIndexPath) -> Int
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    func tableView(tableView: UITableView, cellForSubRowAtIndexPath indexPath: POPFlexibleIndexPath) -> UITableViewCell
    optional func numberOfSectionsInTableView(tableView: UITableView) -> Int
    optional func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    optional func tableView(tableView: UITableView, heightForSubRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    optional func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    optional func tableView(tableView: PopMenuTableView, didSelectSubRowAtIndexPath indexPath: POPFlexibleIndexPath)
    optional func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
    optional func tableView(tableView: PopMenuTableView, didDeselectSubRowAtIndexPath indexPath: POPFlexibleIndexPath)
    optional func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    optional func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    optional func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    optional func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String?
    optional func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    optional func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    optional func tableView(tableView: UITableView, shouldExpandSubRowsOfCellAtIndexPath indexPath: NSIndexPath) -> Bool
}

public class POPFlexibleIndexPath: NSObject{
    public var subRow: Int, row: Int, section: Int, ns: NSIndexPath
    init(forSubRow subrow:Int,inRow row:Int,inSection section:Int){
        self.subRow = subrow
        self.row=row
        self.section=section
        self.ns=NSIndexPath(forRow: row, inSection: section)
    }
}

public class PopMenuTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    public var popFlexibleTableViewDelegate: POPFlexibleTableViewDelegate
    public var shouldExpandOnlyOneCell = false

    let kIsExpandedKey = "isExpanded"
    let kSubrowsKey = "subrowsCount"
    let kDefaultCellHeight = 44.0
    
    public let expandableCells = NSMutableDictionary()
    
    public init(frame: CGRect,delegate: POPFlexibleTableViewDelegate) {
        popFlexibleTableViewDelegate = delegate
        super.init(frame: frame, style: .Plain)
        self.delegate=self
        self.dataSource=self
        refreshData()
    }
    
    required public init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    // MARK: - Table view data source

    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        func menuThumbnails() -> NSArray {
            return ["btn_sm_hubs", "btn_sm_cam", "btn_sm_account", "btn_sm_help", "btn_sm_about"]
        }
        
        let correspondingIndexPath = correspondingIndexPathForRowAtIndexPath(indexPath)
        if correspondingIndexPath.subRow == 0 {
            let expandableCell = popFlexibleTableViewDelegate.tableView(self, cellForRowAtIndexPath:correspondingIndexPath.ns) as! PopMenuTableViewCell
            
            if (expandableCell.expandable) {
                expandableCell.expanded = (expandableCells[correspondingIndexPath.section] as! NSMutableArray)[correspondingIndexPath.row][kIsExpandedKey] as! Bool
                if (expandableCell.expanded){
                    expandableCell.accessoryView!.transform = CGAffineTransformMakeRotation(CGFloat(M_PI));
                }
            }
            
            let arrImageNames = menuThumbnails()
            
            let myCustomSelectionColorView = UIView()
            myCustomSelectionColorView.backgroundColor = DefauleTheme.ThirdColor
            expandableCell.selectedBackgroundView = myCustomSelectionColorView
            expandableCell.imageView?.image = UIImage(named: arrImageNames[indexPath.row] as! String)
            
            return expandableCell;
        } else {
            let cell = popFlexibleTableViewDelegate.tableView(self, cellForSubRowAtIndexPath:correspondingIndexPath)
            cell.indentationLevel = 2
            cell.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0)
            let myCustomSelectionColorView = UIView()
            myCustomSelectionColorView.backgroundColor = DefauleTheme.ThirdColor
            cell.selectedBackgroundView = myCustomSelectionColorView
            cell.textLabel?.textColor = DefauleTheme.MainColor
            
            cell.imageView?.image = UIImage(named: "btn_sm_hubs")
            return cell;
        }
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        let correspondingIndexPath = correspondingIndexPathForRowAtIndexPath(indexPath)
        
        popFlexibleTableViewDelegate.tableView!(self, didSelectSubRowAtIndexPath: correspondingIndexPath)
        
        if let x = cell as? PopMenuTableViewCell {
            
            if !x.expandable { return }
            
            x.expanded = !x.expanded
            
            var _indexPath = indexPath
            let correspondingIndexPath = correspondingIndexPathForRowAtIndexPath(_indexPath)
            if (x.expanded && shouldExpandOnlyOneCell) {
                _indexPath = correspondingIndexPath.ns;
                collapseCurrentlyExpandedIndexPaths()
            }
            
            let numberOfSubRows = numberOfSubRowsAtIndexPath(correspondingIndexPath.ns)
            
            var expandedIndexPaths = [NSIndexPath]()
            let row = _indexPath.row;
            let section = _indexPath.section;
            
            for indexPath in (0..<numberOfSubRows) {
                let expIndexPath = NSIndexPath(forRow:row+indexPath+1, inSection:section)
                expandedIndexPaths.append(expIndexPath)
            }
            
            if x.selected {
                x.imageView?.image = UIImage(named: "btn_sm_hubs")
            } else {
                x.imageView?.image = UIImage(named: "")
            }
            
            if (x.expanded)
            {
                setExpanded(true, forCellAtIndexPath:correspondingIndexPath)
                insertRowsAtIndexPaths(expandedIndexPaths, withRowAnimation:UITableViewRowAnimation.Top)
            }
            else
            {
                setExpanded(false, forCellAtIndexPath:correspondingIndexPath)
                deleteRowsAtIndexPaths(expandedIndexPaths, withRowAnimation:UITableViewRowAnimation.Top)
            }
            
            x.accessoryViewAnimation()
            
            popFlexibleTableViewDelegate.tableView?(self, didSelectRowAtIndexPath:indexPath)
            
        } else {
            
        }
    }

    public func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
        
        let correspondingIndexPath = correspondingIndexPathForRowAtIndexPath(indexPath)
        
        popFlexibleTableViewDelegate.tableView!(self, didDeselectSubRowAtIndexPath: correspondingIndexPath)
    }
    
    public func numberOfExpandedSubrowsInSection(section: Int) -> Int {
        var totalExpandedSubrows = 0;
        
        let rows = expandableCells[section] as! [NSDictionary]
        for row in rows {
            if row[kIsExpandedKey] as! Bool {
                totalExpandedSubrows += row[kSubrowsKey] as! Int
            }
        }
        return totalExpandedSubrows;
    }
    
    public func numberOfSubRowsAtIndexPath(indexPath: NSIndexPath) -> Int {
        return popFlexibleTableViewDelegate.tableView(self, numberOfSubRowsAtIndexPath:indexPath)
    }
    
    func correspondingIndexPathForRowAtIndexPath(indexPath: NSIndexPath) -> POPFlexibleIndexPath {
        var expandedSubrows = 0;
        
        let rows = self.expandableCells[indexPath.section] as! NSArray
        for (index, value) in rows.enumerate() {
            let isExpanded = value[self.kIsExpandedKey] as! Bool
            var numberOfSubrows = 0;
            if (isExpanded){
                numberOfSubrows = value[self.kSubrowsKey] as! Int
            }
            
            let subrow = indexPath.row - expandedSubrows - index;
            if (subrow > numberOfSubrows){
                expandedSubrows += numberOfSubrows;
            }
            else{
                return POPFlexibleIndexPath(forSubRow: subrow, inRow: index, inSection: indexPath.section)
            }
        }
        return POPFlexibleIndexPath(forSubRow: 0, inRow: 0, inSection: 0)
    }
    
    public func setExpanded(isExpanded: Bool, forCellAtIndexPath indexPath: POPFlexibleIndexPath) {
        let cellInfo = (expandableCells[indexPath.section] as! NSMutableArray)[indexPath.row] as! NSMutableDictionary
        cellInfo.setObject(isExpanded, forKey:kIsExpandedKey)
    }
    
    public func collapseCurrentlyExpandedIndexPaths() {
        var totalExpandedIndexPaths = [NSIndexPath]()
        let totalExpandableIndexPaths = NSMutableArray()
        
        for x in expandableCells {
            var totalExpandedSubrows = 0;
            
            for (index, value) in (x.value as! NSArray).enumerate() {
                
                let currentRow = index + totalExpandedSubrows;
                
                if (value[kIsExpandedKey] as! Bool)
                {
                    let expandedSubrows = value[kSubrowsKey] as! Int
                    
                    for indexPath in (0..<expandedSubrows) {
                        let expandedIndexPath = NSIndexPath(forRow:currentRow + indexPath + 1, inSection:x.key as! Int)
                        totalExpandedIndexPaths.append(expandedIndexPath)
                    }
                    
                    value.setObject(false, forKey:kIsExpandedKey)
                    totalExpandedSubrows += expandedSubrows;
                    
                    totalExpandableIndexPaths.addObject(NSIndexPath(forRow:currentRow, inSection:x.key as! Int))
                }
            }
        }
        
        
        for indexPath in totalExpandableIndexPaths
        {
            let cell = cellForRowAtIndexPath(indexPath as! NSIndexPath) as! PopMenuTableViewCell
            cell.expanded = false
            cell.accessoryViewAnimation()
        }
        
        deleteRowsAtIndexPaths(totalExpandedIndexPaths, withRowAnimation:UITableViewRowAnimation.Top)
    }
    
    public func refreshData(){
        expandableCells.removeAllObjects()
        
        for section in (0..<numberOfSections) {
            let numberOfRowsInSection = popFlexibleTableViewDelegate.tableView(self, numberOfRowsInSection:section)
            let rows = NSMutableArray()
            for rowIndex in (0..<numberOfRowsInSection) {
                let rowIndexPath = NSIndexPath(forRow:rowIndex, inSection:section)
                let numberOfSubrows = popFlexibleTableViewDelegate.tableView(self, numberOfSubRowsAtIndexPath:rowIndexPath)
                var isExpandedInitially = false
                if popFlexibleTableViewDelegate.respondsToSelector(#selector(POPFlexibleTableViewDelegate.tableView(_:shouldExpandSubRowsOfCellAtIndexPath:))) {
                    isExpandedInitially = popFlexibleTableViewDelegate.tableView!(self, shouldExpandSubRowsOfCellAtIndexPath:rowIndexPath)
                }
                let rowInfo = NSMutableDictionary(objects:[isExpandedInitially, numberOfSubrows], forKeys:[kIsExpandedKey, kSubrowsKey])
                rows.addObject(rowInfo)
            }
            expandableCells.setObject(rows, forKey:section)
        }
        super.reloadData()
    }
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        if popFlexibleTableViewDelegate.respondsToSelector(#selector(POPFlexibleTableViewDelegate.numberOfSectionsInTableView(_:))) {
            return popFlexibleTableViewDelegate.numberOfSectionsInTableView!(self)
        }
        return 1;
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return popFlexibleTableViewDelegate.tableView(self, numberOfRowsInSection:section) + numberOfExpandedSubrowsInSection(section)
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        let correspondingIndexPath = correspondingIndexPathForRowAtIndexPath(indexPath)
        if correspondingIndexPath.subRow == 0 {
            if popFlexibleTableViewDelegate.respondsToSelector(#selector(POPFlexibleTableViewDelegate.tableView(_:heightForRowAtIndexPath:))) {
                return popFlexibleTableViewDelegate.tableView!(self, heightForRowAtIndexPath:correspondingIndexPath.ns)
            }
            return 44.0;
        } else {
            if popFlexibleTableViewDelegate.respondsToSelector(#selector(POPFlexibleTableViewDelegate.tableView(_:heightForSubRowAtIndexPath:))) {
                return popFlexibleTableViewDelegate.tableView!(self, heightForSubRowAtIndexPath:correspondingIndexPath.ns)
            }
            return 44.0;
        }
    }
    
    public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if popFlexibleTableViewDelegate.respondsToSelector(#selector(POPFlexibleTableViewDelegate.tableView(_:heightForHeaderInSection:))) {
            return popFlexibleTableViewDelegate.tableView!(self, heightForHeaderInSection: section)
        }
        return 0.0
    }
    
    public func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if popFlexibleTableViewDelegate.respondsToSelector(#selector(POPFlexibleTableViewDelegate.tableView(_:heightForFooterInSection:))) {
            return popFlexibleTableViewDelegate.tableView!(self, heightForFooterInSection: section)
        }
        return 0.0
    }
    
    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return popFlexibleTableViewDelegate.tableView?(self, titleForHeaderInSection: section)
    }
    public func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return popFlexibleTableViewDelegate.tableView?(self, titleForFooterInSection: section)
    }
    public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return popFlexibleTableViewDelegate.tableView?(self, viewForHeaderInSection: section)
    }
    public func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return popFlexibleTableViewDelegate.tableView?(self, viewForFooterInSection: section)
    }

}
