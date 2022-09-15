//
//  GoalViewCell.swift
//  CoreDataSwiftUIMVVM
//
//  Created by Михаил Куприянов on 15.09.2022.
//

import SwiftUI

struct GoalViewCell: View {
    let goalName: String
    let goalDescription: String
    let goalDate: Date
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(goalName)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 16)
                    .padding(.leading)
                Text(goalDescription)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 2)
                    .lineLimit(2)
                HStack {
                    Spacer()
                    Text(goalDate, style: .date)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                }
            }
        }
        .background(.red)
        .cornerRadius(12)
    }
}

struct GoalViewCell_Previews: PreviewProvider {
    static var previews: some View {
        GoalViewCell(goalName: "goal Name", goalDescription: "goal Description", goalDate: Date())
    }
}
