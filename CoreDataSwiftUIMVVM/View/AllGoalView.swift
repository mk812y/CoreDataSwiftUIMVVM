//
//  AllGoalView.swift
//  CoreDataSwiftUIMVVM
//
//  Created by Михаил Куприянов on 14.09.2022.
//

import SwiftUI

struct AllGoalView: View {
    @StateObject private var goalListViewModel = GoalListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(goalListViewModel.goals, id: \.goalID) { goal in
                        GoalViewCell(
                            goalName: goal.goalName,
                            goalDescription: goal.goalDescription,
                            goalDate: goal.goalDate
                        )
                    }
                }
            }
            .navigationTitle("All Goal")
            .navigationBarTitleDisplayMode(.large)
            .navigationViewStyle(.stack)
            .padding(.horizontal, 16)
            .onAppear(perform: {
                goalListViewModel.getAllGoals()
            })
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination: AddGoalView(),
                        label: {
                            Image(systemName: "plus.app")
                        }
                    )
            )
        }
        //        Spacer()
    }
}

struct AllGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AllGoalView()
    }
}
