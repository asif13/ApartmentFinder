//
//  FlatDetailViewController.swift
//  RealHack
//
//  Created by Asif Junaid on 4/26/15.
//
//

import UIKit

class FlatDetailViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var viewForAwesome: UIView!
    var modelForFacilities = ["Gym Facility","Tennis Court","Club house","Gymnastic","Swiming pool","Karate club"]
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForAwesome.layer.shadowColor = UIColor.blackColor().CGColor
        viewForAwesome.layer.shadowOffset = CGSizeMake(0, 4)
        viewForAwesome.layer.shadowRadius = 1
        viewForAwesome.layer.shadowOpacity = 0.1
        // Do any additional setup after loading the view.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelForFacilities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell3", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = modelForFacilities[indexPath.row]
        cell.textLabel?.textAlignment = .Center
        //cell.imageOutlet.image = (UIImage(named: imageNames[indexPath.row]))
        return cell
        
    }
}
