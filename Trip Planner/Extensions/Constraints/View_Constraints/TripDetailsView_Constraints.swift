//
//  TripDetailsView_Constraints.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/12/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension TripDetailsView {
    func setViewConstraints() {
        
        // No Waypoints Label Constraints
        
        noWaypointsLabel.translatesAutoresizingMaskIntoConstraints = false
        noWaypointsLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        noWaypointsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        noWaypointsLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        
        
        // Get Started Button Constraints
        
        getStartedBtn.translatesAutoresizingMaskIntoConstraints = false
        getStartedBtn.topAnchor.constraint(equalTo: noWaypointsLabel.bottomAnchor, constant: 10).isActive = true
        getStartedBtn.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        getStartedBtn.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        getStartedBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
}
