//
//  SendItViewController.swift
//  RSNTMNT
//
//  Created by Anders Howerton on 10/6/15.
//  Copyright © 2015 Au. All rights reserved.
//

import UIKit
import MessageUI


class SendItViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextViewDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var affectsListLabel: UILabel!
    @IBOutlet weak var selfishTextView: UITextView!
    @IBOutlet weak var selfSeekingTextView: UITextView!
    @IBOutlet weak var dishonestTextView: UITextView!
    @IBOutlet weak var fearTextView: UITextView!
    @IBOutlet weak var affectsMyListTextView: UITextView!
    @IBOutlet weak var instructionsLabel: UITextView!
    
    @IBOutlet weak var myPartLabel: UILabel!
    
    var who = ""
    var why = ""
    var selfish = ""
    var selfSeeking = ""
    var dishonest = ""
    var fear = ""
    var impact : [String] = []
    var impactString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        self.view.backgroundColor = UIColor( red:0.773, green:0.835, blue:0.796, alpha:1.000)
        
        self.nameLabel.font = UIFont(name: "Didot-Bold", size: 20.0)
        self.descriptionTextView.font = UIFont(name: "Didot-Bold", size: 20.0)
        
        self.affectsListLabel.backgroundColor = UIColor.clearColor()
        self.affectsListLabel.font = UIFont(name: "Didot-Bold", size: 20.0)
        
        self.affectsMyListTextView.backgroundColor = UIColor.clearColor()
        self.affectsMyListTextView.font = UIFont(name: "Helvetica-Light", size: 14.0)
        
        self.myPartLabel.font = UIFont(name: "Didot-Bold", size: 20.0)
        self.dishonestTextView.font = UIFont(name: "Helvetica-Light", size: 12.0)
        self.fearTextView.font = UIFont(name: "Helvetica-Light", size: 12.0)
        self.selfishTextView.font = UIFont(name: "Helvetica-Light", size: 12.0)
        self.selfSeekingTextView.font = UIFont(name: "Helvetica-Light", size: 12.0)
        
        self.who = Resentment.SharedInstance.details["subjectName"] as! String
        self.nameLabel.text = "I have a resentment against " + who
        self.why = Resentment.SharedInstance.details["description"] as! String
        self.descriptionTextView.text = "because: " + why
        
        self.instructionsLabel.font = UIFont(name: "Didot-Bold", size: 12.0)
        
        if Resentment.SharedInstance.details["selfishDetails"] != nil  {
            self.selfish = Resentment.SharedInstance.details["selfishDetails"] as! String
        }
        
        if Resentment.SharedInstance.details["selfSeekingDetails"] != nil {
            self.selfSeeking = Resentment.SharedInstance.details["selfSeekingDetails"] as! String
        }
        
        if Resentment.SharedInstance.details["dishonestDetails"] != nil  {
            self.dishonest = Resentment.SharedInstance.details["dishonestDetails"] as! String
        }
        
        if Resentment.SharedInstance.details["fearDetails"] != nil  {
            self.fear = Resentment.SharedInstance.details["fearDetails"] as! String
        }
        
        if Resentment.SharedInstance.details["impacted"] != nil  {
            self.impact = Resentment.SharedInstance.details["impacted"] as! Array
        }
        
        getImpact()
        
        getMyParts()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

    
    @IBAction func backToMyPartTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func getImpact()  {
        for i in impact  {
            let affected = i
            self.impactString.appendContentsOf(affected)
            if affected != impact.last  {
                self.impactString.appendContentsOf(", ")
            } else {
                self.impactString.appendContentsOf(".")
            }
        }
        self.affectsMyListTextView.text = self.impactString
    }

    func getMyParts() {
        if self.selfish.characters.count > 0  {
            self.selfishTextView.text = selfish
        }
        if self.selfSeeking.characters.count > 0  {
            self.selfSeekingTextView.text = selfSeeking
        }
        if self.dishonest.characters.count > 0  {
            self.dishonestTextView.text = dishonest
        }
        if self.fear.characters.count > 0  {
            self.fearTextView.text = fear
        }
        
    }

    @IBAction func sendEmail(sender: AnyObject) {
        if(MFMailComposeViewController.canSendMail()){
            var body = "I have a resentment against  \(self.who) because \(self.why). This affects my \(self.impactString). The part I played in this is as follows. Selfish: \(self.selfish) Self-seeking: \(self.selfSeeking) Dishonest:  \(self.dishonest) Fearful: \(self.fear)"
            print(body)
            let picker = MFMailComposeViewController()
            picker.mailComposeDelegate = self
            picker.setSubject("RSNTMNT")
            picker.setMessageBody(body, isHTML: true)
            
            presentViewController(picker, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Alert", message: "Your device cannot send emails", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            
        }
    }
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result {
        case MFMailComposeResultCancelled:
          self.dismissViewControllerAnimated(true, completion: nil)
        case MFMailComposeResultSent:
          self.dismissViewControllerAnimated(true, completion: nil)
          backToStart()
        default:
          break
        }
    }
    
    func backToStart() {
        self.performSegueWithIdentifier("startOverFromEndSegue", sender: nil)
    }
    
    @IBAction func sendItToTheArchives(sender: AnyObject) {
        let alertController = UIAlertController(title: "Give It Up!", message:
            "Nice work. Once you file this with your Higher Power or Higher Self, you won't be able to retrieve it.", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action) -> Void in
            print(action)
        }
        alertController.addAction(cancelAction)
        
        let sendAction = UIAlertAction(title: "Send", style: .Destructive) { (action) -> Void in
            self.dishonest = ""
            self.selfish = ""
            self.selfSeeking = ""
            self.fear = ""
            self.dismissViewControllerAnimated(true, completion: nil)
            self.backToStart()
        }
        alertController.addAction(sendAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}
