//
//  PlannedTripsView_Constraints.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/11/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension PlannedTripsView {
    func setViewConstraints() {
        
        // Trips Table View Constraints
        
        tripsTableView.translatesAutoresizingMaskIntoConstraints = false
        tripsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tripsTableView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        tripsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        tripsTableView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
        
    }
}
