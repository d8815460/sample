//
//  CategoryCollectionViewController.swift
//  CommonUX
//
//  Created by 駿逸 陳 on 2016/5/1.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

class CategoryCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let contents = [
        "IP Hub",
        "Light",
        "Wall switch",
        "Garage Door Sensor",
        "Motion sensor",
        "Open/Close Sensor"
    ]
    
    let images = [
        ["ic_add_iphub_n", "ic_add_iphub_h"],
        ["ic_add_light_n", "ic_add_light_h"],
        ["ic_add_switch_n", "ic_add_switch_h"],
        ["ic_add_garage_n", "ic_add_garage_h"],
        ["ic_add_motion_n", "ic_add_motion_h"],
        ["ic_add_open_n", "ic_add_open_h"],
    ]
    
    @IBOutlet var collectionView: UICollectionView!
    
    var cellmodels:NSArray = []
    
    lazy var sapporo: Sapporo = { [unowned self] in
        return Sapporo(collectionView: self.collectionView)
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 36, bottom: 10, right: 36)
        
        cellmodels = (0...5).map { index -> CategoryCellModel in
            return CategoryCellModel(title: contents[index], image: UIImage(named: images[index][0])!, imagePressed: UIImage(named: images[index][1])!, selectionHandler: { cell in
                let indexPath = cell._cellmodel?.indexPath
                cell.tag = (indexPath?.row)!
                print("Selected: indexPath: \(indexPath?.section), \(indexPath?.row)")
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - collectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CategoryCell", forIndexPath: indexPath) as! CategoryCell
        
        cell.titleLabel.text = cellmodels[indexPath.row].title
        cell.imageView.image = cellmodels[indexPath.row].image
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("select", sender: indexPath)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let vc = segue.destinationViewController as! AddToIPHubViewController
        vc.selectIndexPath = sender as! NSIndexPath
    }
    

}
