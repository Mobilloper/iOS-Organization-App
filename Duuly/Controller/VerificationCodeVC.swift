//
//  VerificationCodeVC.swift
//  Duuly
//
//  Created by ACoding on 11/29/17.
//  Copyright © 2017 Mobilloper. All rights reserved.
//

import UIKit

class VerificationCodeVC: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.tag)
        if textField.tag == 6{
            if textField.text?.count == 1{
                performSegue(withIdentifier: "loggedin", sender: nil)

            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        performSegue(withIdentifier: "loggedin", sender: nil)
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
