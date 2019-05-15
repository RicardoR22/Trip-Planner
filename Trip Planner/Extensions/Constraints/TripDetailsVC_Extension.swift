//
//  TripDetailsVC_Extension.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/14/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension TripDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trip.waypoints?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "waypoint cell", for: indexPath) as! TripsTableViewCell
        let waypoint = trip.waypoints?.object(at: indexPath.row) as! Waypoints
        cell.label.text = waypoint.name
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let waypoint = trip.waypoints?.object(at: indexPath.row) as! Waypoints
            trip.removeFromWaypoints(waypoint)
            store.saveTrip()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let waypoint = trip.waypoints?.object(at: indexPath.row) as! Waypoints
        let waypointDetailVC = WaypointDetailViewController()
        waypointDetailVC.store = store
        waypointDetailVC.trip = trip
        waypointDetailVC.waypoint = waypoint
        
        navigationController?.pushViewController(waypointDetailVC, animated: true)
        
    }
}
