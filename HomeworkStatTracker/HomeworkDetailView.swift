//
//  HomeworkDetailView.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/30/26.
//

import SwiftUI

struct HomeworkDetailView: View {
    @Environment(\.dismiss) private var dismiss
    var homeworkType: String
    var homeworkName: String
    var avgHomeworkRating : Int
    var avgHomeworkDifficulty : Int
    var subject: String
    var dueDate: Date
    var body: some View {
        VStack{
            Text("\(homeworkName) (\(homeworkType))")
                .font(.custom("Georgia", size: 40, relativeTo: .headline))
            Text("Due date: \(dueDate.formatted(date: .abbreviated, time: .omitted))")
                .font(.custom("Georgia", size: 20, relativeTo: .headline))
            Spacer()
            Text("Average rating: \(avgHomeworkRating) \n Average difficulty: \(avgHomeworkDifficulty)")
                .font(.custom("Georgia", size: 20, relativeTo: .headline))
            Spacer()
            HStack{
                Spacer()
                Button("Mark completed"){
                    
                    dismiss()
                }
                .buttonStyle(.glassProminent)
                Spacer()
                Button("return"){
                    
                    dismiss()
                }
                .buttonStyle(.glassProminent)
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    HomeworkDetailView(homeworkType: "Idrk", homeworkName: "Idek", avgHomeworkRating: -1, avgHomeworkDifficulty: -1, subject: "Idke", dueDate: Date.now)
}
