//
//  UpdateProfileViewController.swift
//  RealHack
//
//  Created by Asif Junaid on 4/26/15.
//
//

import UIKit

class UpdateProfileViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var releigion: UITextField!
    @IBOutlet weak var foodPreference2: UITextField!
    @IBOutlet weak var foodPreference: UITextField!
    @IBOutlet weak var schoolAdress: UITextField!
    @IBOutlet weak var officeAddress: UITextField!
    @IBOutlet weak var budgetMax: UITextField!
    @IBOutlet weak var budgetMin: UITextField!
    var current : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        var logButton : UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "doneFunc")
        self.navigationItem.rightBarButtonItem = logButton
        releigion.delegate = self
        foodPreference2.delegate = self
        foodPreference.delegate = self
        schoolAdress.delegate = self
        officeAddress.delegate = self
        budgetMax.delegate = self
        budgetMin.delegate = self
        
    }
    func doneFunc()
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        current = textField
        
    }
    func textFieldDidEndEditing(textField: UITextField) {
                current = nil
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
            textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        current?.resignFirstResponder()
    }
}
