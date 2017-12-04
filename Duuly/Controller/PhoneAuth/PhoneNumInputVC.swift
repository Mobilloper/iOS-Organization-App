//
//  LoginVC.swift
//  Duuly
//
//  Created by ACoding on 11/29/17.
//  Copyright © 2017 Mobilloper. All rights reserved.
//

import UIKit
import CountryList

//import Firebase
//import FirebaseAuthUI
//import FirebasePhoneAuthUI

class PhoneNumInputVC: UIViewController, CountryListDelegate {

    @IBOutlet weak var lblCountryCode: UILabel!
    @IBOutlet weak var lblCountryName: UILabel!
    
    var countryList = CountryList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countryList.delegate = self
        
//        FUIAuth.defaultAuthUI()?.delegate = self
//        let phoneProvider = FUIPhoneAuth.init(authUI: FUIAuth.defaultAuthUI()!)
//        FUIAuth.defaultAuthUI()?.providers = [phoneProvider]
//
//        let phoneProvider1 = FUIAuth.defaultAuthUI()?.providers.first as! FUIPhoneAuth
//        phoneProvider.signIn(withPresenting: currentlyVisibleController, phoneNumber: nil)
//
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBtnCountryList(_ sender: Any) {
        let navController = UINavigationController(rootViewController: countryList)
        self.present(navController, animated: true, completion: nil)
    }
    @IBAction func onBtnDone(_ sender: Any) {
        performSegue(withIdentifier: "authcode", sender: nil)
    }
    
    func selectedCountry(country: Country) {
        self.lblCountryCode.text = "\(country.phoneExtension)"
        self.lblCountryName.text = "\(country.flag!) \(country.name!), \(country.countryCode)"
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
