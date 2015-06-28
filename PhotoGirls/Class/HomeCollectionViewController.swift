//
//  HomeCollectionViewController.swift
//  PhotoGirls
//
//  Created by NHK on 6/18/15.
//  Copyright (c) 2015 PhotoGirls. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class HomeCollectionViewController: UICollectionViewController {
    var images:NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Menu"
        images = NSMutableArray()
        images.addObject("download.jpeg")
        images.addObject("images.jpeg")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       // self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return images.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as UICollectionViewCell
        // Configure the cell
        let tag:Int = 999
        let image:UIImageView = cell.viewWithTag(tag) as UIImageView
        image.image = UIImage(named: images.objectAtIndex(indexPath.row) as String)
        let title:UILabel = cell.viewWithTag(998 as Int) as UILabel
         let description:UILabel = cell.viewWithTag(100 as Int) as UILabel
        if (indexPath.row == 0){
            title.text = "Lan xinh"
            description.text = "sinh vien thieu tien 300/shot"
        }
        else
        {
            title.text = "Ngoc xinh"
            description.text = "em di motel 400k/shot"
        }
        
        return cell
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        let preview:PreviewViewController = self.storyboard?.instantiateViewControllerWithIdentifier("preview") as PreviewViewController!
        self.navigationController?.pushViewController(preview, animated: true)
        
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
