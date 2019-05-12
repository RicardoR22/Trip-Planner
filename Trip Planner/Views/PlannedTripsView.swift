//
//  PlannedTripsView.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/11/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class PlannedTripsView: UIView {

    var tripsTableView = UITableView()
    var plannedTrips: [Trip] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    

    func setupView() {
        backgroundColor = .white
        setupSubViews()
        tripsTableView.register(TripsTableViewCell.self, forCellReuseIdentifier: "trip cell")

        setViewConstraints()
    }
    
    func setupSubViews() {
        addSubview(tripsTableView)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
