//
//  ViewController.swift
//  RSNTMNT
//
//  Created by Anders Howerton on 10/5/15.
//  Copyright © 2015 Au. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var introQuoteLabel: UITextView!
    let backgroundImage = UIImage(named: "logoRSNTMNTxsTrans.gif")
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.blackColor()
        
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        let singleTap = UITapGestureRecognizer(target: self, action: "tapStart")
        singleTap.numberOfTapsRequired = 1
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(singleTap)
        
        self.introQuoteLabel.font = UIFont(name: "Didot-Bold", size: 17.0)
        self.introQuoteLabel.editable = false;
        self.introQuoteLabel.backgroundColor = UIColor.clearColor();
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor( red:0.773, green:0.835, blue:0.796, alpha:1.000).CGColor,UIColor( red:0.659, green:0.714, blue:0.749, alpha:1.000).CGColor,UIColor( red:0.133, green:0.149, blue:0.294, alpha:1.000).CGColor]
        gradient.startPoint = CGPoint(x: 0.50, y: 0.00)
        gradient.endPoint = CGPoint(x: 0.50, y: 1.00)
        self.view.layer.insertSublayer(gradient, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toNewTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("toNewRsntmntSegue", sender: self)
    }
    
    func tapStart() {
        self.performSegueWithIdentifier("toNewRsntmntSegue", sender: self)
    }
    
        
    @IBAction func startOverFromEndSegue(unwindSegue: UIStoryboardSegue) {
    
    }

}

