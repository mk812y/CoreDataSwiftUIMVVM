//
//  AddGoalView.swift
//  CoreDataSwiftUIMVVM
//
//  Created by Михаил Куприянов on 15.09.2022.
//

import SwiftUI

struct AddGoalView: View {
    @StateObject private var goalListViewModel = GoalListViewModel()
    @State private var dateGoal = Date()
    
    var body: some View {
        VStack(spacing: 24) {
            VStack {
                Text("Goal Name")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                TextField("Enter Goal Name", text: $goalListViewModel.goalName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Goal Date")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                DatePicker(
                    "Select Goal Date",
                    selection: $dateGoal,
                    displayedComponents: [.date]
                )
                .frame(height: 20)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Goal Description")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                TextField("Enter Goal Description", text: $goalListViewModel.goalDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Spacer()
            HStack {
                Spacer()
                Button("Save") {
                    goalListViewModel.goalDate = dateGoal
                    goalListViewModel.saveGoal()
                }
                .foregroundColor(.white)
                .padding()
                Spacer()
            }
            .background(Color.accentColor)
            .cornerRadius(8)
            .padding()
        }
        .padding()
        .navigationTitle("Add Goal")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView()
    }
}
