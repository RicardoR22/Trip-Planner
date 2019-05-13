//
//  PlannedTripsVC_Extension.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/11/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension PlannedTripsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plannedTripsView.plannedTrips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trip cell", for: indexPath) as! TripsTableViewCell
        
        cell.label.text = self.plannedTripsView.plannedTrips[indexPath.row].tripName
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            store.delete(item: self.plannedTripsView.plannedTrips[indexPath.row])
            self.plannedTripsView.plannedTrips.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tripDetailVC = TripDetailsViewController()
        tripDetailVC.store = store
        tripDetailVC.trip = self.plannedTripsView.plannedTrips[indexPath.row]
        
        navigationController?.pushViewController(tripDetailVC, animated: true)
        
    }
}
