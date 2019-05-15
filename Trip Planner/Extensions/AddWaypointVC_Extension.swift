//
//  AddWaypointVC_Extension.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/14/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

extension AddWaypointViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addWaypointView.placePredictions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prediction cell", for: indexPath) as! TripsTableViewCell
        
        cell.label.attributedText = self.addWaypointView.placePredictions[indexPath.row].attributedFullText
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPlace = self.addWaypointView.placePredictions[indexPath.row]
        let placeID = selectedPlace.placeID
        
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
            UInt(GMSPlaceField.coordinate.rawValue) | UInt(GMSPlaceField.formattedAddress.rawValue))!
        
        self.addWaypointView.placesClient.fetchPlace(fromPlaceID: placeID, placeFields: fields, sessionToken: nil, callback: {
            (place: GMSPlace?, error: Error?) in
            if let error = error {
                print("An error occurred: \(error.localizedDescription)")
                return
            }
            if let place = place {
                self.selectedPlace = place
                self.marker.position = place.coordinate
                self.marker.title = place.name
                self.marker.snippet = place.formattedAddress
                self.marker.map = self.addWaypointView.mapView
                self.addWaypointView.mapView.camera = GMSCameraPosition(target: self.marker.position, zoom: 12, bearing: 0, viewingAngle: 0)
            }
        })
        
    }
}


