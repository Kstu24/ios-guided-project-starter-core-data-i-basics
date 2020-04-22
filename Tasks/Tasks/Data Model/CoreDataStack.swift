//
//  CoreDataStack.swift
//  Tasks
//
//  Created by Kevin Stewart on 4/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    // This is a shared instance of the core data stack
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "Tasks") //(name: kCFBundleNameKey as String) allows you to use the same name as your data model
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
     // Makes the access to the context faster
     // Reminds you to use the context on the main queue
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
}

