//
//  WaypointDetailView.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/15/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class WaypointDetailView: UIView {
    

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
        setViewConstraints()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

    }
    
    func setupSubViews() {
        addSubview(tripAddressLabel)
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 12.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        addSubview(mapView)
    }
    
    var tripAddressLabel: UILabel = {
        let textField = UILabel()
        textField.layer.cornerRadius = 5
        textField.numberOfLines = 2
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 18)
        textField.textAlignment = .center
        
        
        return textField
    }()
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
}

extension WaypointDetailView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        locationManager.startUpdatingLocation()
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    

    
}

