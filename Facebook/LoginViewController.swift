//
//  LoginViewController.swift
//  Facebook
//
//  Created by Annette Brookman on 5/25/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var signupParentView: UIView!
    @IBOutlet weak var fbLogoImageView: UIImageView!
    
    var initialFieldY: CGFloat!
    var initialSignupY: CGFloat!
    var initialLogoY: CGFloat!
    var offsetField: CGFloat!
    var offsetSignup: CGFloat!
    var offsetLogo: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        
        initialFieldY = fieldParentView.frame.origin.y
        offsetField = -30
        
        initialSignupY = signupParentView.frame.origin.y
        offsetSignup = -230
        
        initialLogoY = fbLogoImageView.frame.origin.y
        offsetLogo = -10
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        fieldParentView.frame.origin.y = initialFieldY + offsetField
        signupParentView.frame.origin.y = initialSignupY + offsetSignup
        fbLogoImageView.frame.origin.y = initialLogoY + offsetLogo
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        fieldParentView.frame.origin.y = initialFieldY
        signupParentView.frame.origin.y = initialSignupY
        fbLogoImageView.frame.origin.y = initialLogoY
        
        
    }
    
    @IBAction func didTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        
        loginIndicator.startAnimating()
        loginButton.selected = true
        
        delay(2.0) { () -> () in
            if self.emailField.text == "annette" && self.passwordField.text == "password" {
                
                self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
                self.performSegueWithIdentifier("yourSegue", sender: nil)
            } else {
                
                let alertController = UIAlertController(title: "Incorrect Email & Password", message: "Please try again", preferredStyle: .Alert)
                // create a cancel action
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
                print("Password incorrect")
                self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
            }
        }
        
        
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
