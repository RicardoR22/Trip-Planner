//
//  NewTripView_Constraints.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/11/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension AddTripView {
    func setViewConstraints() {
        
        // Instruction Label Constraints
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        
    
        // Trip Name Text Field Constraints
        
        tripNameField.translatesAutoresizingMaskIntoConstraints = false
        tripNameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        tripNameField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        tripNameField.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        tripNameField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
}
