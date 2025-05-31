//
//  PersistenceManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation
import CoreData

class PersistenceManager {
    static let shared = PersistenceManager()

    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "Acreage")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error loading persistent stores: \(error), \(error.userInfo)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return container.viewContext
    }

    func save() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error saving context: \(nsError), \(nsError.userInfo)")
            }
        }
    }

    func fetch<T: NSManagedObject>(_ type: T.Type, predicate: NSPredicate? = nil) -> [T] {
        let request = T.fetchRequest()
        request.predicate = predicate

        do {
            return try context.fetch(request) as! [T]
        } catch {
            print("Error fetching data: \(error)")
            return []
        }
    }
}
