//
//  CalendarVC.swift
//  Duuly
//
//  Created by ACoding on 11/27/17.
//  Copyright © 2017 Mobilloper. All rights reserved.
//

import UIKit
import FSCalendar
import SideMenu

class CalendarVC: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDelegate, FSCalendarDataSource, UIGestureRecognizerDelegate{
    
    //IBOutlets
    @IBOutlet weak var btnNewAppointment: UIButton!
    @IBOutlet weak var vCalendar: FSCalendar!
    @IBOutlet weak var tvAppointments: UITableView!
    
    @IBOutlet weak var calendarHeightContstraint: NSLayoutConstraint!
    
    //Properties
    fileprivate weak var calendar:FSCalendar!
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    fileprivate lazy var scopeGesture: UIPanGestureRecognizer = {
        [unowned self] in
        let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
        panGesture.delegate = self
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 2
        return panGesture
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initScreen()
        initSideMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK: -CustomFunc
    func initScreen() {
        btnNewAppointment.layer.cornerRadius = btnNewAppointment.bounds.width / 2
        
        self.vCalendar.select(Date())
        
        self.view.addGestureRecognizer(self.scopeGesture)
        self.tvAppointments.panGestureRecognizer.require(toFail: self.scopeGesture)
        self.vCalendar.scope = .week
    }
    
    func initSideMenu(){
        
        let menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.default.menuRightNavigationController = menuRightNavigationController
        
//        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
//        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        SideMenuManager.default.menuPresentMode = .viewSlideInOut
        SideMenuManager.default.menuFadeStatusBar = false
    }
    // MARK:- UIGestureRecognizerDelegate
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let shouldBegin = self.tvAppointments.contentOffset.y <= -self.tvAppointments.contentInset.top
        if shouldBegin {
            let velocity = self.scopeGesture.velocity(in: self.view)
            switch self.vCalendar.scope {
            case .month:
                return velocity.y < 0
            case .week:
                return velocity.y > 0
            }
        }
        return shouldBegin
    }
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendarHeightContstraint.constant = bounds.height
        self.view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("did select date \(self.dateFormatter.string(from: date))")
        let selectedDates = calendar.selectedDates.map({self.dateFormatter.string(from: $0)})
        print("selected dates is \(selectedDates)")
        if monthPosition == .next || monthPosition == .previous {
            calendar.setCurrentPage(date, animated: true)
        }
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        print("\(self.dateFormatter.string(from: calendar.currentPage))")
        
    }
    
    //MARK: - IBActions
    @IBAction func onBtnNewAppointment(_ sender: Any) {
        performSegue(withIdentifier: "newappointment", sender: nil)
    }
    
    @IBAction func onSideMenu(_ sender: Any) {
        present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentcell", for: indexPath)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tpHeader = UITableViewHeaderFooterView()
        let header = tpHeader as UIView
        var headerFrame = tableView.frame
        headerFrame.size.height = 44
        header.frame = headerFrame
        
        let lblDate = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 44))
        
        lblDate.textAlignment = .center
        lblDate.text = "Today, 9 September"
        
        header.addSubview(lblDate)
        
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
        return 44
    }
    
    //MARK: - FSCalendarDelegate
    
    //MARK: - FSCalendarDataSource
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
