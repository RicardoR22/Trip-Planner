//
//  WaypointDetailViewController.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/15/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps


class WaypointDetailViewController: UIViewController {
    
    var waypointDetailView: WaypointDetailView!
    var store: TripStore!
    var trip: Trip!
    var waypoint: Waypoints!
    let marker = GMSMarker()
    var selectedPlace: GMSPlace!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // MARK: View setup
    
    func setup() {
        setupNav()
        setupView()
        waypointDetailView.tripAddressLabel.text = waypoint.address
        waypointDetailView.mapView.camera = GMSCameraPosition(latitude: waypoint.latitude, longitude: waypoint.longitude, zoom: 12.0)
        self.marker.position = CLLocationCoordinate2D(latitude: waypoint.latitude, longitude: waypoint.longitude)
        self.marker.title = waypoint.name
        self.marker.snippet = waypoint.address
        self.marker.map = self.waypointDetailView.mapView

    }
    
    func setupNav() {
        navigationController?.navigationBar.tintColor = UIColor(white: 1, alpha: 0.7)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = waypoint.name
        
        let back = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backTapped))
        back.tintColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        navigationItem.leftBarButtonItem = back
        
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func setupView() {
        let mainView = WaypointDetailView(frame: self.view.frame)
        self.waypointDetailView = mainView
        self.view.addSubview(waypointDetailView)
        setWaypointDetailViewConstraints()
       
    }
    
    
    
}
