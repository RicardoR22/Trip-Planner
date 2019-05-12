//
//  PlannedTripsVC_Constraints.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/11/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension PlannedTripsViewController {
    
    func setPlannedTripsViewConstraints() {
        plannedTripsView.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(item: plannedTripsView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: view.frame.width)
        let heightConstraint = NSLayoutConstraint(item: plannedTripsView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: view.frame.height)
        let horizontalConstraint = NSLayoutConstraint(item: plannedTripsView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: plannedTripsView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
        self.view.addConstraints([widthConstraint, heightConstraint, horizontalConstraint, verticalConstraint])
    }
}
