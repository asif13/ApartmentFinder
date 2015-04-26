//
//  ProfileViewController.swift
//  RealHack
//
//  Created by Asif Junaid on 4/26/15.
//
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var shadowDropView: UIView!
    @IBOutlet weak var outletForButton: UIButton!
    @IBOutlet weak var chitru: UIImageView!
    var modelAboutUser = ["Non vegetarian","Movie Buff","Single","Avenger","HSR Layout office"]
    override func viewDidLoad() {
        super.viewDidLoad()
        chitru.layer.cornerRadius = chitru.frame.width / 8
        chitru.clipsToBounds = true
        shadowDropView.layer.shadowColor = UIColor.blackColor().CGColor
        shadowDropView.layer.shadowOffset = CGSizeMake(0, 4)
        shadowDropView.layer.shadowRadius = 1
        shadowDropView.layer.shadowOpacity = 0.1
        outletForButton.layer.borderWidth = 1
        outletForButton.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelAboutUser.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = modelAboutUser[indexPath.row]
        return cell
        
    }

}
