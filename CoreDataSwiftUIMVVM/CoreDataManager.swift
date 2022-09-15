//
//  CoreDataManager.swift
//  CoreDataSwiftUIMVVM
//
//  Created by Михаил Куприянов on 14.09.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveGoal() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    func getAllGoal() -> [Goal] {
        let request: NSFetchRequest<Goal> = Goal.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "CoreDataDemoModel")
        persistentContainer.loadPersistentStores { (description, error ) in
            if let error = error {
                fatalError("Unable to initialize core data stack \(error)")
            }
        }
    }
}
