//
//  NewTripViewController.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/11/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {

    var addTripView: AddTripView!
    var store: TripStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: View setup
    
    func setup() {
        setupNav()
        setupView()
    }
    
    func setupNav() {
        navigationController?.navigationBar.tintColor = UIColor(white: 1, alpha: 0.7)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Add Trip"
        
        let addTrip = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTripTapped))
        addTrip.tintColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        navigationItem.rightBarButtonItem = addTrip
        
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        cancel.tintColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        navigationItem.leftBarButtonItem = cancel
    }
    
    @objc func saveTripTapped() {
        guard let tripName = addTripView.tripNameField.text else { return }
        
        let trip = store.createNewTrip()
        trip.tripName = tripName
        store.saveTrip()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func cancelTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func setupView() {
        let mainView = AddTripView(frame: self.view.frame)
        self.addTripView = mainView
        self.view.addSubview(addTripView)
        setAddTripViewConstraints()
    }


}
