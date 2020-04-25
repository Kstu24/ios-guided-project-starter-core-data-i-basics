//
//  TaskTableViewCell.swift
//  Tasks
//
//  Created by Ben Gohlke on 4/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static let reuseIdentifier = "TaskCell"
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - IBOutlets/IBActions
    @IBOutlet var completedButton: UIButton!
    @IBOutlet var taskNameLabel: UILabel!
    

    @IBAction func toggleComplete(_ sender: Any) {
        guard let task = task else { return }
        task.completed.toggle()
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch {
            NSLog("Error saving context: \(error)")
            CoreDataStack.shared.mainContext.reset()
        }
        
        let buttonImage = task.completed ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
        completedButton.setImage(buttonImage, for: .normal)
        
    }
    
    func updateViews() {
        guard let task = task else { return }
        let buttonImage = task.completed ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
        completedButton.setImage(buttonImage, for: .normal)
        taskNameLabel.text = task.name
    }
    
}
