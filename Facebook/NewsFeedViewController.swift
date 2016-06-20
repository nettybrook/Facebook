//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    var imageTransition: ImageTransition!
    
    @IBOutlet weak var containerView: UIView!
    var selectedImageView: UIImageView!

  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let photoViewController = segue.destinationViewController as! PhotoViewController
        
        photoViewController.photoImage = selectedImageView.image
        
        // set the modal presentation to be custom
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        imageTransition = ImageTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in imageTransition for transition instructions.
        photoViewController.transitioningDelegate = imageTransition
        
        // Adjust the transition duration. (seconds)
        imageTransition.duration = 1.0
   
    }

    @IBAction func onTapPhoto(sender: UITapGestureRecognizer) {
        
        selectedImageView = sender.view as! UIImageView
        
        performSegueWithIdentifier("photoSegue", sender: nil)
        


    }
    

}
