//
//  SelfishViewController.swift
//  RSNTMNT
//
//  Created by Anders Howerton on 10/14/15.
//  Copyright © 2015 Au. All rights reserved.
//

import UIKit

class SelfishViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var selfishDetailsTextView: UITextView!
    @IBOutlet weak var selfishHeaderLabel: UILabel!
    @IBOutlet weak var notSaintsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.tintColor = UIColor.blackColor()
        self.selfishHeaderLabel.font = UIFont(name: "Didot-Bold", size: 20.0)
        self.notSaintsLabel.font = UIFont(name: "Didot-Bold", size: 14.0)
        
        self.selfishDetailsTextView.layer.borderWidth = 0.5
        self.selfishDetailsTextView.layer.cornerRadius = 10
        self.selfishDetailsTextView.layer.borderColor = UIColor.blackColor().CGColor
        self.selfishDetailsTextView.textContainerInset = UIEdgeInsets(top: 8,left: 5,bottom: 8,right: 5)
        self.selfishDetailsTextView.font = UIFont(name: "Helvetica-Light", size: 14.0)
        self.selfishDetailsTextView.delegate = self
        self.selfishDetailsTextView.returnKeyType = .Done
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor( red:0.129, green:0.145, blue:0.290, alpha:1.000).CGColor,UIColor( red:0.659, green:0.714, blue:0.745, alpha:1.000).CGColor,UIColor( red:0.773, green:0.831, blue:0.792, alpha:1.000).CGColor,UIColor( red:0.773, green:0.831, blue:0.792, alpha:1.000).CGColor,UIColor( red:0.659, green:0.714, blue:0.745, alpha:1.000).CGColor,UIColor( red:0.129, green:0.145, blue:0.290, alpha:1.000).CGColor]
        gradient.startPoint = CGPoint(x: 0.50, y: 0.00)
        gradient.endPoint = CGPoint(x: 0.50, y: 1.00)
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
                
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
    

    @IBAction func closeMyPartTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        Resentment.SharedInstance.details["selfishDetails"] = selfishDetailsTextView.text
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        Resentment.SharedInstance.details["selfishDetails"] = selfishDetailsTextView.text
    }
    

}
