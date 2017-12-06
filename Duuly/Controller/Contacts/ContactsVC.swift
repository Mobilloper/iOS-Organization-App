//
//  ContactsVC.swift
//  Duuly
//
//  Created by ACoding on 11/27/17.
//  Copyright © 2017 Mobilloper. All rights reserved.
//

import UIKit
import SideMenu

class ContactsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSideMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initSideMenu(){
        
        let menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.default.menuRightNavigationController = menuRightNavigationController
        
//        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
//        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        SideMenuManager.default.menuPresentMode = .viewSlideInOut
        SideMenuManager.default.menuFadeStatusBar = false
    }
    
    //MARK: -TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactscell", for: indexPath) as! ContactsTVCell
        cell.selectionStyle = .none
        
        return cell
    }
    //MARK: -TableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "appointmentlist", sender: nil)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactslist" {
//            let controller = segue.destination as! SomeonesAppointmentListVC
            
        }
    }

    @IBAction func onSideMenu(_ sender: Any) {
        present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
    }
}
