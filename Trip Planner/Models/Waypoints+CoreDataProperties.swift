//
//  Waypoints+CoreDataProperties.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/12/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//
//

import Foundation
import CoreData


extension Waypoints {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Waypoints> {
        return NSFetchRequest<Waypoints>(entityName: "Waypoints")
    }

    @NSManaged public var name: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var address: String?
    @NSManaged public var placeID: String?  
    @NSManaged public var trip: Trip?

}
