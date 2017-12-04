//
//  SomeonesAppointmentListVC.swift
//  Duuly
//
//  Created by ACoding on 12/1/17.
//  Copyright © 2017 Mobilloper. All rights reserved.
//

import UIKit

class SomeonesAppointmentListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -TableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentlistcell", for: indexPath) as! AppointmentListTVCell
        cell.selectionStyle = .none
        
        return cell
    }
    //MARK: -TableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "appointmentdetail", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onBarBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
