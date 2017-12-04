//
//  AppointmentDetailVC.swift
//  Duuly
//
//  Created by ACoding on 12/1/17.
//  Copyright © 2017 Mobilloper. All rights reserved.
//

import UIKit

class AppointmentDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -TableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int{
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 {
            return 2
        }else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "appointmenttitlecell", for: indexPath) as! AppointmentTitleCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "appointmenttimecell", for: indexPath) as! AppointmentTimeCell
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentaddresscell", for: indexPath) as! AppointmentAddressCell
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentstatuscell", for: indexPath) as! AppointmentStatusCell
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentacceptcell", for: indexPath) as! AppointmentAcceptCell
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "appointmenttitlecell", for: indexPath) as! AppointmentTitleCell
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        switch indexPath.section {
        case 0:
            return 110
        case 1:
            return 120
        case 2:
            return 74
        case 3:
            return 62
        case 4:
            return 120
        default:
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tpHeader = UITableViewHeaderFooterView()
        let header = tpHeader as UIView
        var headerFrame = tableView.frame
        headerFrame.size.height = 16
        header.frame = headerFrame
        
        let transition = CATransition()
        transition.duration = 0.1
        transition.type = kCATransitionPush
        header.layer.add(transition, forKey: nil)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let tmpFooter = UITableViewHeaderFooterView()
        let footer = tmpFooter as UIView
        
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    
    //MARK: -TableViewDelegate

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
