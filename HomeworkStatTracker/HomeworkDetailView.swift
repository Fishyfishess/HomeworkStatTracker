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
        VStack{
            Text("\(homework.homeworkName) (\(homework.homeworkType))")
                .font(.custom("Georgia", size: 40, relativeTo: .headline))
            Text("Due date: \(homework.dueDate.formatted(date: .abbreviated, time: .omitted))")
                .font(.custom("Georgia", size: 20, relativeTo: .headline))
            Text("Subject: \(homework.subject)")
                .font(.custom("Georgia", size: 20, relativeTo: .headline))
            Spacer()
//            Text("Average rating: \(homework.avgHomeworkRating) \n Average difficulty: \(homework.avgHomeworkDifficulty)")
//                .font(.custom("Georgia", size: 20, relativeTo: .headline))
            Spacer()
            HStack{
                Button("Mark completed"){
                    if let index = appData.shared.subject.homeworkType[homework.subject]{
                        print("ongoing")
                        appData.shared.subject.homework[index].append(homework)
                        print("success?")
                        print(appData.shared.subject.homework[index])
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
