//
//  Trip+CoreDataProperties.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/11/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var tripName: String?
    @NSManaged public var waypoints: Waypoints?

}
