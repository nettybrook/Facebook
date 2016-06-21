//
//  ImageTransition.swift
//  Facebook
//
//  Created by Annette Brookman on 6/19/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
    //unpack the feedview controller
    let tabViewController = fromViewController as! UITabBarController
    let navigationController = tabViewController.selectedViewController as! UINavigationController
    let feedViewController = navigationController.topViewController as! NewsFeedViewController
    let photoViewController = toViewController as! PhotoViewController
    
//    // Getting the key window
//    var window = UIApplication.sharedApplication().keyWindow
//    // Adding a view
//    var frame = window.convertRect(selectedImageView.frame, fromView: containerView)
    
    // It takes the next 4 lines to clone and image in a new view
    // 1. cloned image view --- this creates a new image named moving image
    let movingImageView = UIImageView()
    
    // 2. this makes the image in moving image the same as the selected image
    movingImageView.image = feedViewController.selectedImageView.image
    
    //3. this makes the sizes match (to start)
    movingImageView.frame = feedViewController.selectedImageView.frame
    
    movingImageView.center = feedViewController.selectedImageView.center
    movingImageView.center.y = feedViewController.selectedImageView.center.y
//    newlyCreatedFace.center = imageView.center
//    newlyCreatedFace.center.y += trayView.frame.origin.y
//    newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
    // 4. this ensures that the images have the same contentMode i.e aspect fill
    movingImageView.contentMode = feedViewController.selectedImageView.contentMode
    
    // Adding movingimage as a subview
    containerView.addSubview(movingImageView)
    
    
    
    photoViewController.photoImageView.alpha = 0
//    feedViewController.selectedImageView.alpha = 0
    
    toViewController.view.alpha = 0
    UIView.animateWithDuration(0.5, animations: {
            
            toViewController.view.alpha = 1
    movingImageView.frame = photoViewController.photoImageView.frame
        
            }) { (finished: Bool) -> Void in
                
//                movingImageView.frame = CGRect(x: 100, y: 150, width: 320, height: 503)
                photoViewController.photoImageView.alpha = 1
                movingImageView.alpha = 0
                
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabViewController = toViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! NewsFeedViewController
        let photoViewController = fromViewController as! PhotoViewController

        //1.
        let movingbackImageView = UIImageView()
        
        // 2. this makes the image in moving image the same as the selected image
        movingbackImageView.image = photoViewController.photoImageView.image
        
        //3. this makes the sizes match (to start)
        movingbackImageView.frame = photoViewController.photoImageView.frame
        
        movingbackImageView.center = photoViewController.photoImageView.center
        
        // 4. this ensures that the images have the same contentMode i.e aspect fill
        movingbackImageView.contentMode = photoViewController.photoImageView.contentMode
        
        // Adding movingimage as a subview
        containerView.addSubview(movingbackImageView)
        
        fromViewController.view.alpha = 1
        
        UIView.animateWithDuration(0.2, animations: {
            
            fromViewController.view.alpha = 0
            movingbackImageView.frame = feedViewController.selectedImageView.frame
            movingbackImageView.frame.origin.x = feedViewController.selectedImageView.frame.origin.x
 
            
            }) { (finished: Bool) -> Void in
                
                movingbackImageView.alpha = 0
                self.finish()
        }
    }

}
