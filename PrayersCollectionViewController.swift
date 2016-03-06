//
//  PrayersCollectionViewController.swift
//  RSNTMNT
//
//  Created by Anders Howerton on 2/11/16.
//  Copyright © 2016 Au. All rights reserved.
//

import UIKit

private let reuseIdentifier = "prayerCell"

class PrayersCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var toMyPartButton: UIBarButtonItem!
    
    let prayers = ["The following are suggestions. Substiute as necessary. Read aloud if possible.", "Higher Power (or Higher Self), Thy will, not theirs, be done.", "Release my anger.", "Let me show as much patience and compassion as I would a sick friend.", "How can I be helpful?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
//        self.collectionView?.scrollToItemAtIndexPath(NSIndexPath(forItem: prayers.count - 1, inSection: 0), atScrollPosition: .Left, animated: false)
//        var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .Horizontal
        
        //set gesture tap recognizers to scroll horizontally??? already set scroll to no.
        self.navigationController!.navigationBar.tintColor = UIColor.grayColor()
        self.toMyPartButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.prayers.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        print(indexPath)
        print(prayers.count)
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PrayerCollectionCell
        // Configure the cell
        let prayer: String = self.prayers[indexPath.row]
        cell.prayerTextView.textColor = UIColor.whiteColor()
        cell.prayerTextView.font = UIFont(name: "HelveticaNeue-Light", size: 17.0)
        cell.prayerTextView.backgroundColor = UIColor.blackColor()
        cell.prayerTextView.text = prayer
        
        if (indexPath.row == prayers.count-1) {
            self.toMyPartButton.enabled = true
            self.toMyPartButton.tintColor = UIColor( red:0.773, green:0.835, blue:0.796, alpha:1.000)
        }
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 10000.0
        self.collectionView?.pagingEnabled = true
        self.collectionView?.setCollectionViewLayout(layout, animated: true)
        
    }
    
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
