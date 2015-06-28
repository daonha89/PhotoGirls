//
//  ViewController.swift
//  PhotoGirls
//
//  Created by NHK on 6/17/15.
//  Copyright (c) 2015 PhotoGirls. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
    @IBOutlet weak var iconUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    var nav:UINavigationController!
    var pickerViewController:UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayerInSubView()
        controlNavigationBar()
        let target = UITapGestureRecognizer(target: self, action: Selector("changerIcon"))
        iconUser.addGestureRecognizer(target)
        iconUser.userInteractionEnabled = true
        pickerViewController = UIImagePickerController()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addLayerInSubView(){
        let main:HomeCollectionViewController = self.storyboard?.instantiateViewControllerWithIdentifier("home") as HomeCollectionViewController!
        let root:NSArray = [main]
        nav = UINavigationController(rootViewController: main)
        nav.navigationBar.barTintColor = UIColor.blueColor()
        self.view.addSubview(nav.view)
    }
    func controlNavigationBar(){
        var btLeft:UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        btLeft .setImage(UIImage(named: "Menu_button_24.png"), forState: UIControlState.Normal)
        btLeft.frame = CGRectMake(0, 0, 25, 25)
        btLeft.addTarget(self, action: Selector("showMenu"), forControlEvents: UIControlEvents.TouchUpInside)
        let customBt = UIBarButtonItem(customView: btLeft )
        nav.topViewController.navigationItem.leftBarButtonItem = customBt
        
        let btRight = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("addPhoto"))
        nav.topViewController.navigationItem.rightBarButtonItem = btRight
        
    }
    func addPhoto(){
        let postPhoto:PostPhotoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("post") as PostPhotoViewController!
        nav.pushViewController(postPhoto, animated: true)
    }
    func showMenu(){
        // test
        UIView.animateWithDuration( 0.3, animations: {
            
            var offset:CGFloat = 200
            if (Utils().IS_IPAD){
                offset = 250
            }
            var rect = self.nav.view.frame as CGRect!

            if (self.nav.view.frame.origin.x >= offset){
                rect.origin.x -= offset
            }
            else{
                rect.origin.x += offset
            }
            self.nav.view.frame = rect
            
            }) { (value:Bool) -> Void in
            
        }
    }
    func setImageIcon(iconImage:UIImage){
        iconUser.image = iconImage
    }
    func setNameUser(name:NSString){
        nameUser.text = name
    }
    func changerIcon(){
        pickerViewController.allowsEditing = false
        pickerViewController.sourceType = .PhotoLibrary
        pickerViewController.delegate = self
        presentViewController(pickerViewController, animated: true, completion: nil)

    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            setImageIcon(pickedImage)
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}

