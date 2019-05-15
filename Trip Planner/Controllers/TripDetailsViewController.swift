//
//  TripDetailsViewController.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/12/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class TripDetailsViewController: UIViewController {

    var tripDetailsView: TripDetailsView!
    var store: TripStore!
    var trip: Trip!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tripDetailsView.waypointsTable.reloadData()
        navigationController?.navigationBar.prefersLargeTitles = true
        toggleViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view, typically from a nib.
        tripDetailsView.waypointsTable.delegate = self
        tripDetailsView.waypointsTable.dataSource = self
    }
    
    // MARK: View setup
    
    func setup() {
        setupNav()
        setupView()
        tripDetailsView.tripNameLabel.text = trip.tripName
        toggleViews()
    }
    
    func toggleViews() {
        if trip.waypoints!.count > 0 {
            tripDetailsView.view2.isHidden = false
            tripDetailsView.view1.isHidden = true
        } else {
            tripDetailsView.view2.isHidden = true
            tripDetailsView.view1.isHidden = false
        }
    }
    
    func setupNav() {
        navigationController?.navigationBar.tintColor = UIColor(white: 1, alpha: 0.7)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = trip.tripName
        
        let back = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backTapped))
        back.tintColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        navigationItem.leftBarButtonItem = back
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWaypointTapped))
        add.tintColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        
        if trip!.waypoints!.count > 0 {
            navigationItem.rightBarButtonItem = add
        }
    }
    
    @objc func addWaypointTapped() {
        let addWaypointVC = AddWaypointViewController()
        addWaypointVC.store = self.store
        addWaypointVC.trip = self.trip
        navigationController?.pushViewController(addWaypointVC, animated: true)
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupView() {
        let mainView = TripDetailsView(frame: self.view.frame)
        self.tripDetailsView = mainView
        self.view.addSubview(tripDetailsView)
        setTripDetailsViewConstraints()
        self.tripDetailsView.getStartedBtn.addTarget(self, action: #selector(addWaypointTapped), for: .touchUpInside)
        self.tripDetailsView.addWaypointBtn.addTarget(self, action: #selector(addWaypointTapped), for: .touchUpInside)
    }

}
