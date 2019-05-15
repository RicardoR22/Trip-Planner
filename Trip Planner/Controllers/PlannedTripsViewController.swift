//
//  PlannedTripsViewController.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/11/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class PlannedTripsViewController: UIViewController {

    var plannedTripsView: PlannedTripsView!
    var store: TripStore!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateDataSource()
        plannedTripsView.tripsTableView.reloadData()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        updateDataSource()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: View setup
    
    func setup() {
        setupNav()
        setupView()
        plannedTripsView.tripsTableView.delegate = self
        plannedTripsView.tripsTableView.dataSource = self
    }
    
    func setupNav() {
        navigationController?.navigationBar.tintColor = UIColor(white: 1, alpha: 0.7)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Planned Trips"
        
        let addTrip = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTripTapped))
        addTrip.tintColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        navigationItem.rightBarButtonItem = addTrip
    
    }
    
    @objc func addTripTapped() {
        let addTripVC = AddTripViewController()
        addTripVC.store = store
        navigationController?.pushViewController(addTripVC, animated: true)
    }
    
    
    func setupView() {
        let mainView = PlannedTripsView(frame: self.view.frame)
        self.plannedTripsView = mainView
        self.view.addSubview(plannedTripsView)
        setPlannedTripsViewConstraints()
    }
    
    private func updateDataSource() {
        self.store.fetchTripsData {
            
            (fetchItemsResult) in
            
            switch fetchItemsResult {
            case let .success(items):
                self.plannedTripsView.plannedTrips = items
            case .failure(_):
                self.plannedTripsView.plannedTrips.removeAll()
            }
        }
    }
    
}
