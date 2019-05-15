//
//  WaypointDetailView_Constraints.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/15/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import Foundation
import UIKit

extension WaypointDetailView {
    func setViewConstraints() {
        
        // waypoint name Label Constraints
        
        tripAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        tripAddressLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        tripAddressLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        tripAddressLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        tripAddressLabel.heightAnchor.constraint(equalToConstant: self.frame.height * 0.2).isActive = true
        
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: tripAddressLabel.bottomAnchor, constant: 5).isActive = true
        mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        mapView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        mapView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    }
}
