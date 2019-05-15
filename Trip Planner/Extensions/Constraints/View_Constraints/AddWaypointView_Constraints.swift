//
//  AddWaypointView_Constraints.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/14/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import Foundation
import UIKit

extension AddWaypointView {
    func setViewConstraints() {
        
        // Trips Table View Constraints
        
        placePredictionTable.translatesAutoresizingMaskIntoConstraints = false
        placePredictionTable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        placePredictionTable.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        placePredictionTable.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        placePredictionTable.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: placePredictionTable.bottomAnchor, constant: 5).isActive = true
        mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        mapView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        mapView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    }
}
