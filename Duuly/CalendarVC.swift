//
//  CalendarVC.swift
//  Duuly
//
//  Created by ACoding on 11/27/17.
//  Copyright © 2017 Mobilloper. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController {

    @IBOutlet weak var btnNewAppointment: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        initScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initScreen() {
        btnNewAppointment.layer.cornerRadius = btnNewAppointment.bounds.width / 2
    }
    
    @IBAction func onBtnNewAppointment(_ sender: Any) {
        performSegue(withIdentifier: "newappointment", sender: nil)
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
