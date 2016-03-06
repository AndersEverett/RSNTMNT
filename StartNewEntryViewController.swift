//
//  StartNewEntryViewController.swift
//  RSNTMNT
//
//  Created by Anders Howerton on 10/5/15.
//  Copyright © 2015 Au. All rights reserved.
//

import UIKit

class StartNewEntryViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var againstLabel: UILabel!
    @IBOutlet weak var becauseLabel: UILabel!
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var continueButton: UIButton!
    
    let firstColor = UIColor(red:0.659, green:0.714, blue:0.749, alpha:1.000)
    let secondColor = UIColor(red: 179.0/255.0, green: 255.0/255.0, blue: 236.0/255.0, alpha: 1.0)
    let thirdColor = UIColor(red: 140.0/255.0, green: 178.0/255.0, blue: 217.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.againstLabel.font = UIFont(name: "Didot-Bold", size: 25.0)
        self.becauseLabel.font = UIFont(name: "Didot-Bold", size: 25.0)
        self.continueButton.titleLabel!.font = UIFont(name: "Didot-Bold", size: 17.0)
        self.continueButton.tintColor = UIColor.blackColor()
        
        self.navigationController!.navigationBar.tintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.view.backgroundColor = firstColor
        
        self.descriptionTextView.layer.borderWidth = 0.33
        self.descriptionTextView.layer.cornerRadius = 10
        self.descriptionTextView.backgroundColor = UIColor.clearColor()
        self.descriptionTextView.font = UIFont(name: "Helvetica-Light", size: 14.0)
        
        self.subject.backgroundColor = UIColor.clearColor()
        self.subject.font = UIFont(name: "Helvetica-Light", size: 14.0)
        
        let length = descriptionTextView.text
        
        self.descriptionTextView.delegate = self
        self.descriptionTextView.returnKeyType = .Done
            
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
    
    
    override func viewDidAppear(animated: Bool) {
        view.backgroundColor = firstColor
        self.animateBackground()
    }
    
    //add an NSTimer in here to preserve memory?
    func animateBackground() {
        print(secondColor)
        let words = descriptionTextView.text
        
        if words.characters.count < 20 {
            UIView.animateWithDuration(8, animations: {
                self.view.backgroundColor = self.firstColor
                }){ (stuff Bool) -> Void in
                    self.animateBackground()
            }
        
        } else if words.characters.count < 60  {
            UIView.animateWithDuration(8, animations: {
                self.view.backgroundColor = self.secondColor
            }){ (stuff Bool) -> Void in
            self.animateBackground()
            }
        
        } else if words.characters.count < 100 {
            UIView.animateWithDuration(5, animations: {
                self.view.backgroundColor = self.thirdColor
                }){ (stuff Bool) -> Void in
                    self.animateBackground()
            }
        }        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        Resentment.SharedInstance.details["subjectName"] = subject.text
        Resentment.SharedInstance.details["description"] = descriptionTextView.text
        
    }
    

}
