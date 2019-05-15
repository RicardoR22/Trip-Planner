//
//  AddWaypointVC_Constraints.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/14/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import Foundation
import UIKit

extension AddWaypointViewController {
    
    func setAddWaypointViewConstraints() {
        addWaypointView.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(item: addWaypointView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: view.frame.width)
        let heightConstraint = NSLayoutConstraint(item: addWaypointView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: view.frame.height)
        let horizontalConstraint = NSLayoutConstraint(item: addWaypointView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: addWaypointView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
        self.view.addConstraints([widthConstraint, heightConstraint, horizontalConstraint, verticalConstraint])
    }
}
