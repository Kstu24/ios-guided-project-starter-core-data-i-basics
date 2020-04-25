//
//  Task+Convienience.swift
//  Tasks
//
//  Created by Kevin Stewart on 4/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData

enum TaskPriority: String, CaseIterable {
    case low
    case normal
    case high
    case critical
}

// We need a way to initialize a Task object given its properties
extension Task {
    
    @discardableResult convenience init(identifier: UUID = UUID(),
                     completed: Bool = false,
                     notes: String,
                     name: String,
                     priority: TaskPriority,
                     context: NSManagedObjectContext) {
        
        // Set up the NSManagedObject portion of the Task Object
        self.init(context: context)
        
        // Assign our unique values to the attributes we created in the data model file
        self.identifier = identifier
        self.completed = completed
        self.notes = notes
        self.name = name
        self.priority = priority.rawValue
        
        
    }
    
}
