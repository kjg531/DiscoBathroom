//
//  AboutViewController.swift
//  Disco Bathroom
//
//  Created by KG on 4/9/16.
//  Copyright © 2016 Kenneth Gabbara. All rights reserved.
//

import UIKit
import MessageUI

class AboutViewController: UIViewController {
    
    //*****************************************************************
    // MARK: - ViewDidLoad
    //*****************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    //*****************************************************************
    // MARK: - IBActions
    //*****************************************************************
    
    @IBAction func emailButtonDidTouch(sender: UIButton) {
        
        // Use your own email address & subject
        let receipients = [" info@discobathroom.com"]
        let subject = "From Disco Bathroom"
        let messageBody = ""
        
        let configuredMailComposeViewController = configureMailComposeViewController(receipients, subject: subject, messageBody: messageBody)
        
        if canSendMail() {
            self.presentViewController(configuredMailComposeViewController, animated: true, completion: nil)
        } else {
            showSendMailErrorAlert()
        }
    }
    
    @IBAction func websiteButtonDidTouch(sender: UIButton) {
        
        // Use your own website here
        if let url = NSURL(string: "https://discobathroom.com") {
            UIApplication.sharedApplication().openURL(url)
        }
    }

  }

//*****************************************************************
// MARK: - MFMailComposeViewController Delegate
//*****************************************************************

extension AboutViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func canSendMail() -> Bool {
        return MFMailComposeViewController.canSendMail()
    }
    
    func configureMailComposeViewController(recepients: [String], subject: String, messageBody: String) -> MFMailComposeViewController {
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(recepients)
        mailComposerVC.setSubject(subject)
        mailComposerVC.setMessageBody(messageBody, isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
}
