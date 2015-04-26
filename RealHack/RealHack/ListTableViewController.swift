//
//  ListTableViewController.swift
//  RealHack
//
//  Created by Asif Junaid on 4/26/15.
//
//

import UIKit

class ListTableViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var modelForFlats = ["Raja Ram Apartment","Villa suite","Apartment number 34","houing apartment"]
    var imageNames = ["ap1.jpeg","ap2.jpeg","ap3.jpg","ap2.jpeg"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return modelForFlats.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomTableViewCell
        
        cell.title1.text = modelForFlats[indexPath.row]
        
        cell.imageOutlet.image = (UIImage(named: imageNames[indexPath.row]))
        
        return cell
        
    }
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let signInStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = signInStoryboard.instantiateViewControllerWithIdentifier("flatDetailView") as! UIViewController
        self.navigationController?.pushViewController(signInVC, animated: true)
    }

}
