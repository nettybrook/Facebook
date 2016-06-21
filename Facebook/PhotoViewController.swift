//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Annette Brookman on 6/18/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    var photoImage: UIImage!
    var imageTransition: ImageTransition!

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var doneImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        photoImageView.image = photoImage
        
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        mainView.backgroundColor = UIColor(white: 0, alpha: 1)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapDone(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
     
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
        UIView.animateWithDuration(0.2) { () -> Void in
            self.mainView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            self.doneImageView.alpha = 0
        }
        
    }

    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            
            UIView.animateWithDuration(0.2) { () -> Void in
                self.mainView.backgroundColor = UIColor(white: 0, alpha: 1)
                self.doneImageView.alpha = 1
            }
            if (scrollView.contentOffset.y < -100) {
                print("Im registering the offset")
               
                dismissViewControllerAnimated(true, completion: nil)
   
            }


    
    
        // This method is called when the scrollview finally stops scrolling.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return photoImageView
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
