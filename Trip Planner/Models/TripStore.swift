//
//  TripStore.swift
//  Trip Planner
//
//  Created by Ricardo Rodriguez on 5/11/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit
import CoreData



enum FetchTripsResult {
    case success([Trip])
    case failure(Error)
}

class TripStore: NSObject {
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Trip_Planner")
        

        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error setting up Core Data (\(error)).")
            }
        }
        return container
    }()
    
    func saveTrip() {
        let viewContext = persistentContainer.viewContext
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
       
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func createNewTrip() -> Trip {
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "Trip", into: persistentContainer.viewContext) as! Trip
        return newItem
    }
    
    func fetchTripsData(completion: @escaping (FetchTripsResult) -> Void) {
        
        let fetchRequest: NSFetchRequest<Trip> = Trip.fetchRequest()
        let viewContext = persistentContainer.viewContext
        
        do {
            let allItems = try viewContext.fetch(fetchRequest)
            completion(.success(allItems))
        } catch {
            completion(.failure(error))
        }
    }
    
    func delete(item: NSManagedObject) {
        let viewContext = persistentContainer.viewContext
        viewContext.delete(item)
        saveTrip()
    }
    
}
