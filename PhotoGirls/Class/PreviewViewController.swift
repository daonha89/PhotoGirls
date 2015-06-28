//
//  PreviewViewController.swift
//  PhotoGirls
//
//  Created by NHK on 6/18/15.
//  Copyright (c) 2015 PhotoGirls. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    var scvImage: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scvImage = UIScrollView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height))
        self.view .addSubview(scvImage)
        // Do any additional setup after loading the view.
    }
     override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        showPreviewImage()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showPreviewImage(){
        var count:CGFloat = 0
        for (count;count < 3;count++){
            let imageView:UIImageView = UIImageView(frame: CGRectMake(count * UIScreen.mainScreen().bounds.size.width, 0, UIScreen.mainScreen().bounds.size.width, scvImage.frame.size.height))
            imageView.backgroundColor = UIColor.redColor()
            scvImage.addSubview(imageView)
            
            }
        scvImage.contentSize = CGSizeMake(scvImage.frame.size.width * 3, scvImage.frame.size.height)
        print(scvImage.contentSize.height)
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
