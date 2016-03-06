//
//  AffectsMyViewController.swift
//  RSNTMNT
//
//  Created by Anders Howerton on 10/5/15.
//  Copyright © 2015 Au. All rights reserved.
//

import UIKit


class AffectsMyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var affectsLabel: UILabel!
    @IBOutlet weak var categories: UITableView!
    @IBOutlet weak var continueInventoryButton: UIButton!
    
    let firstColor = UIColor(red:0.659, green:0.714, blue:0.749, alpha:1.000)
    var types = ["ambition", "self-esteem", "pride", "personal relationships", "security", "$$$$", "sexual relationships"]
    var selected : NSMutableArray = []
    var checkedColor = UIColor( red:0.773, green:0.835, blue:0.796, alpha:1.000)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categories.delegate = self
        self.categories.dataSource = self
        self.categories.backgroundColor = firstColor
        self.categories.tintColor = UIColor.blackColor()

        self.affectsLabel.font = UIFont(name: "Didot-Bold", size: 25.0)
        
        self.view.backgroundColor = firstColor
        self.navigationController!.navigationBar.tintColor = UIColor.blackColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.contentView.backgroundColor = firstColor
        cell.backgroundColor = firstColor
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("typeCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel!.text = types[indexPath.row]
        cell.textLabel!.textAlignment = .Center
        cell.backgroundColor = firstColor
        cell.contentView.backgroundColor = firstColor
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20.0)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let name : AnyObject = types[indexPath.row]
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if cell.accessoryType == UITableViewCellAccessoryType.Checkmark {
            cell.accessoryType = UITableViewCellAccessoryType.None
            selected.removeObject(name)
            
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.addObject(name)
            cell.contentView.backgroundColor = self.checkedColor    
            cell.backgroundColor = self.checkedColor
        }
        
    }
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.backgroundColor = self.checkedColor
        cell?.contentView.backgroundColor = self.checkedColor
        
    
    }
    
    func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.contentView.backgroundColor = self.firstColor
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        Resentment.SharedInstance.details["impacted"] = selected
    }

}
