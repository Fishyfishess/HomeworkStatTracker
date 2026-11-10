//
//  HomeworkDetailView.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/30/26.
//

import SwiftUI

struct HomeworkDetailView: View {
    @Environment(\.dismiss) private var dismiss
    var homework : Homework
    var body: some View {
        @State var rating = appData.shared.subjects[homework.subject]?.analyzeRating(homeworkType: homework.homeworkType)
        @State var difficulty = appData.shared.subjects[homework.subject]?.analyzeDifficulty(homeworkType: homework.homeworkType)
        @State var timeSpent = appData.shared.subjects[homework.subject]?.analyzeTimeSpent(homeworkType: homework.homeworkType)
        VStack{
            Text("\(homework.homeworkName) (\(homework.homeworkType))")
                .font(.custom("Georgia", size: 40, relativeTo: .headline))
            Text("Due date: \(homework.dueDate.formatted(date: .abbreviated, time: .omitted))")
                .font(.custom("Georgia", size: 20, relativeTo: .headline))
            Text("Subject: \(homework.subject)")
                .font(.custom("Georgia", size: 20, relativeTo: .headline))
            Spacer()
            Text("Statistics for this homework type below:")
                .font(.custom("Georgia", size: 30, relativeTo: .headline))
            Text("Average personal rating: \(rating ?? -1)")
                .font(.custom("Georgia", size: 20, relativeTo: .headline))
            Text("Average personal difficulty: \(difficulty ?? -1)")
                .font(.custom("Georgia", size: 20, relativeTo: .headline))
            Text("Average  time spent: \(timeSpent ?? -1)")
                .font(.custom("Georgia", size: 20, relativeTo: .headline))
            Spacer()
//            Text("Average rating: \(homework.avgHomeworkRating) \n Average difficulty: \(homework.avgHomeworkDifficulty)")
//                .font(.custom("Georgia", size: 20, relativeTo: .headline))
            Spacer()
            HStack{
                Button("Mark completed"){
                        print("ongoing")
                    if let a = appData.shared.subjects[homework.subject]{
                        a.homework.append(homework)
                        print("success?")
                    }
                    for i in 0..<appData.shared.toDoList.count{
                        if appData.shared.toDoList[i].uid == homework.uid {
                            appData.shared.toDoList.remove(at: i)
                        }
                    }
                    dismiss()
                }
                .buttonStyle(.glassProminent)
            }
        }
        .padding()
    }
}

#Preview {
    HomeworkDetailView(homework: Homework(homeworkType: "N/A", homeworkName: "N/A", homeworkRating: -1, homeworkDifficulty: -1, subject: "N/A", dueDate: Date.distantPast, timeSpent: 0))
}
