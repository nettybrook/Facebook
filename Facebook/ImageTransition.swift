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
    
    // cloned image view --- this copies the selected image view
    let movingImageView = UIImageView()
    movingImageView.image = feedViewController.selectedImageView.image
    movingImageView.frame = feedViewController.selectedImageView.frame
    feedViewController.selectedImageView.contentMode = feedViewController.selectedImageView.contentMode
    
    // Adding a subview
    containerView.addSubview(movingImageView)

    photoViewController.photoImageView.alpha = 0
    //    feedViewController.selectedImageView.alpha = 0
 
    
    toViewController.view.alpha = 0
    
    
        UIView.animateWithDuration(duration, animations: {
            photoViewController.view.alpha = 1
            
            movingImageView.frame = photoViewController.photoImageView.frame
            
            }) { (finished: Bool) -> Void in
                
                photoViewController.photoImageView.alpha = 1
                
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }

}
