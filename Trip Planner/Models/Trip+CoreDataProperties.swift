//
//  Trip+CoreDataProperties.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/12/19.
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
    @NSManaged public var waypoints: NSOrderedSet?

}

// MARK: Generated accessors for waypoints
extension Trip {

    @objc(insertObject:inWaypointsAtIndex:)
    @NSManaged public func insertIntoWaypoints(_ value: Waypoints, at idx: Int)

    @objc(removeObjectFromWaypointsAtIndex:)
    @NSManaged public func removeFromWaypoints(at idx: Int)

    @objc(insertWaypoints:atIndexes:)
    @NSManaged public func insertIntoWaypoints(_ values: [Waypoints], at indexes: NSIndexSet)

    @objc(removeWaypointsAtIndexes:)
    @NSManaged public func removeFromWaypoints(at indexes: NSIndexSet)

    @objc(replaceObjectInWaypointsAtIndex:withObject:)
    @NSManaged public func replaceWaypoints(at idx: Int, with value: Waypoints)

    @objc(replaceWaypointsAtIndexes:withWaypoints:)
    @NSManaged public func replaceWaypoints(at indexes: NSIndexSet, with values: [Waypoints])

    @objc(addWaypointsObject:)
    @NSManaged public func addToWaypoints(_ value: Waypoints)

    @objc(removeWaypointsObject:)
    @NSManaged public func removeFromWaypoints(_ value: Waypoints)

    @objc(addWaypoints:)
    @NSManaged public func addToWaypoints(_ values: NSOrderedSet)

    @objc(removeWaypoints:)
    @NSManaged public func removeFromWaypoints(_ values: NSOrderedSet)

}
