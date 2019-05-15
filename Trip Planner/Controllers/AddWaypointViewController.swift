//
//  AddWaypointViewController.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/14/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps


class AddWaypointViewController: UIViewController {

    var addWaypointView: AddWaypointView!
    var store: TripStore!
    var trip: Trip!
    let marker = GMSMarker()
    var selectedPlace: GMSPlace!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        addWaypointView.placePredictionTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: View setup
    
    func setup() {
        setupNav()
        setupView()
        addWaypointView.placePredictionTable.delegate = self
        addWaypointView.placePredictionTable.dataSource = self
        addWaypointView.searchBar.delegate = self.addWaypointView
        
    }
    
    func setupNav() {
        navigationController?.navigationBar.tintColor = UIColor(white: 1, alpha: 0.7)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Add a Waypoint"
        
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        cancel.tintColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        navigationItem.leftBarButtonItem = cancel
        
        let saveWaypoint = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveWaypointTapped))
        saveWaypoint.tintColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        navigationItem.rightBarButtonItem = saveWaypoint
        
    }
    
    @objc func cancelTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveWaypointTapped() {
        let waypoint = Waypoints(context: store!.persistentContainer.viewContext)
        
        guard let place = selectedPlace else {return}
        waypoint.name = place.name
        waypoint.longitude = place.coordinate.longitude
        waypoint.latitude = place.coordinate.latitude
        waypoint.address = place.formattedAddress
        waypoint.placeID = place.placeID
        
        trip.addToWaypoints(waypoint)
        store.saveTrip()
        navigationController?.popViewController(animated: true)
    
    }
    
    
    func setupView() {
        let mainView = AddWaypointView(frame: self.view.frame)
        self.addWaypointView = mainView
        self.view.addSubview(addWaypointView)
        setAddWaypointViewConstraints()
    }
    
    
    
}

