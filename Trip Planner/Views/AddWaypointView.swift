//
//  AddWaypointView.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/14/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class AddWaypointView: UIView {

    var placePredictionTable = UITableView()
    var placePredictions: [GMSAutocompletePrediction] = []
    var camera: GMSCameraPosition!
    var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    let placesClient = GMSPlacesClient()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView() {
        backgroundColor = .white
        setupSubViews()
        placePredictionTable.register(TripsTableViewCell.self, forCellReuseIdentifier: "trip cell")
        createHeaderView()
        setViewConstraints()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        placePredictionTable.register(TripsTableViewCell.self, forCellReuseIdentifier: "prediction cell")
    }
    
    func setupSubViews() {
        addSubview(placePredictionTable)
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        addSubview(mapView)
    }
    
    let searchBar = UISearchBar()
    
    func createHeaderView() {
        // Header for ingredients list
        searchBar.frame = CGRect(x: 0, y: 0, width: self.placePredictionTable.frame.width, height: 50)
        
        
        addSubview(searchBar)
        placePredictionTable.tableHeaderView = searchBar

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     * Create a new session token. Be sure to use the same token for calling
     * findAutocompletePredictions, as well as the subsequent place details request.
     * This ensures that the user's query and selection are billed as a single session.
     */
    let token = GMSAutocompleteSessionToken.init()
    
    // Create a type filter.
    let filter = GMSAutocompleteFilter()
    
    func getPredictions(query: String) {
        filter.type = .establishment
        
        placesClient.findAutocompletePredictions(fromQuery: query,
        bounds: nil,
        boundsMode: GMSAutocompleteBoundsMode.bias,
        filter: filter,
        sessionToken: token,
        callback: { (results, error) in
            if let error = error {
                print("Autocomplete error: \(error)")
                return
            }
            if let results = results {
                print(results)
                self.placePredictions = results
                self.placePredictionTable.reloadData()
            }
        })
    }
}

extension AddWaypointView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        locationManager.startUpdatingLocation()
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 12, bearing: 0, viewingAngle: 0)
        
        locationManager.stopUpdatingLocation()
    }
}

extension AddWaypointView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getPredictions(query: searchText)
    }
}


