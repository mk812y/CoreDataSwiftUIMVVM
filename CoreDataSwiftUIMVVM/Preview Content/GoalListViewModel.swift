//
//  GoalListViewModel.swift
//  CoreDataSwiftUIMVVM
//
//  Created by Михаил Куприянов on 14.09.2022.
//

import Foundation
import CoreData

class GoalListViewModel: ObservableObject {
    var goalName: String = ""
    var goalDate: Date = Date()
    var goalDescription: String = ""
    
    @Published var goals: [GoalViewModel] = []
    
    func getAllGoals() {
        goals = CoreDataManager.shared.getAllGoal().map(GoalViewModel.init)
    }
    
    func saveGoal() {
        let goal = Goal(context: CoreDataManager.shared.viewContext)
        goal.goalName = goalName
        goal.goalDate = goalDate
        goal.goalDescription = goalDescription
        
        CoreDataManager.shared.saveGoal()
    }
}

struct GoalViewModel {
    let goal: Goal
    
    var goalID: NSManagedObjectID {
        return goal.objectID
    }
    
    var goalName: String {
        return goal.goalName ?? ""
    }
    
    var goalDescription: String {
        return goal.goalDescription ?? ""
    }
    
    var goalDate: Date {
        return goal.goalDate ?? Date()
    }
    
    
}
