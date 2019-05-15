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
        
        // view1 Constraints
        
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        view1.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        view1.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        view1.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        view2.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        view2.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        view2.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        
        // No Waypoints Label Constraints
        
        noWaypointsLabel.translatesAutoresizingMaskIntoConstraints = false
        noWaypointsLabel.centerYAnchor.constraint(equalTo: view1.centerYAnchor).isActive = true
        noWaypointsLabel.centerXAnchor.constraint(equalTo: view1.centerXAnchor).isActive = true
        noWaypointsLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        
        
        // Get Started Button Constraints
        
        getStartedBtn.translatesAutoresizingMaskIntoConstraints = false
        getStartedBtn.topAnchor.constraint(equalTo: noWaypointsLabel.bottomAnchor, constant: 10).isActive = true
        getStartedBtn.centerXAnchor.constraint(equalTo: view1.centerXAnchor).isActive = true
        getStartedBtn.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        getStartedBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // trip name Label Constraints
        
        tripNameLabel.translatesAutoresizingMaskIntoConstraints = false
        tripNameLabel.centerXAnchor.constraint(equalTo: view2.centerXAnchor).isActive = true
        tripNameLabel.topAnchor.constraint(equalTo: view2.topAnchor, constant: 30).isActive = true
        tripNameLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        tripNameLabel.heightAnchor.constraint(equalToConstant: self.frame.height * 0.15).isActive = true
        
        
        // Get Started Button Constraints
        
        addWaypointBtn.translatesAutoresizingMaskIntoConstraints = false
        addWaypointBtn.topAnchor.constraint(equalTo: tripNameLabel.bottomAnchor, constant: 5).isActive = true
        addWaypointBtn.centerXAnchor.constraint(equalTo: view2.centerXAnchor).isActive = true
        addWaypointBtn.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        addWaypointBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // Waypoints TableView constraints
        waypointsTable.translatesAutoresizingMaskIntoConstraints = false
        waypointsTable.topAnchor.constraint(equalTo: addWaypointBtn.bottomAnchor, constant: 20).isActive = true
        waypointsTable.bottomAnchor.constraint(equalTo: view2.bottomAnchor).isActive = true
        waypointsTable.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
    }
}
