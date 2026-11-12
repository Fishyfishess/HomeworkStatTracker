//
//  HomeworkDetailView.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/30/26.
//

import SwiftUI

struct HomeworkDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State var homework : Homework
    @State var thisRating = "--"
    @State var thisDifficulty = "--"
    @State var thisTimeSpent = ""
    @State var submit = false
    var body: some View {
        @State var rating = appData.shared.subjects[homework.subject]?.analyzeRating(homeworkType: homework.homeworkType)
        @State var difficulty = appData.shared.subjects[homework.subject]?.analyzeDifficulty(homeworkType: homework.homeworkType)
        @State var timeSpent = appData.shared.subjects[homework.subject]?.analyzeTimeSpent(homeworkType: homework.homeworkType)
        NavigationStack{
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
                Spacer()
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
                if submit{
                    Text("Submission page")
                        .font(.custom("Georgia", size: 40, relativeTo: .headline))
                    VStack(alignment: .leading){
                        HStack{
                            Text("Rate this homework")
                            Menu {
                                Button("5"){
                                    thisRating = "5"
                                }
                                Button("4"){
                                    thisRating = "4"
                                }
                                Button("3"){
                                    thisRating = "3"
                                }
                                Button("2"){
                                    thisRating = "2"
                                }
                                Button("1"){
                                    thisRating = "1"
                                }
                            } label: {
                                Label(thisRating, systemImage: "chevron.down")
                                    .frame(width: 145)
                                    .padding()
                                    .background(.regularMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .foregroundStyle(.black)
                            }
                        }
                        HStack{
                            Text("Rate difficulty")
                            Menu {
                                Button("5"){
                                    thisDifficulty = "5"
                                }
                                Button("4"){
                                    thisDifficulty = "4"
                                }
                                Button("3"){
                                    thisDifficulty = "3"
                                }
                                Button("2"){
                                    thisDifficulty = "2"
                                }
                                Button("1"){
                                    thisDifficulty = "1"
                                }
                            } label: {
                                Label(thisDifficulty, systemImage: "chevron.down")
                                    .frame(width: 190)
                                    .padding()
                                    .background(.regularMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .foregroundStyle(.black)
                            }
                        }
                        HStack{
                            Text("Total time spent")
                            TextField("enter time (in mins)", text: $thisTimeSpent)
                                .padding()
                                .background(.regularMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                    .padding()
                    HStack{
                        Button("submit"){
                            if let x = Int(thisRating) {
                                homework.homeworkRating = x
                            }
                            if let y = Int(thisDifficulty) {
                                homework.homeworkDifficulty = y
                            }
                            if let z = Int(thisTimeSpent) {
                                homework.timeSpent = z
                            }
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
                        Button("return"){
                            dismiss()
                        }
                        .buttonStyle(.glassProminent)
                    }
                } else {
                    HStack{
                        Button("submit"){
                            submit.toggle()
                        }
                        .buttonStyle(.glassProminent)
                        Button("return"){
                            dismiss()
                        }
                        .buttonStyle(.glassProminent)
                    }
                }
                HStack{
//                    Button("Mark completed"){
//                        print("ongoing")
//                        if let a = appData.shared.subjects[homework.subject]{
//                            a.homework.append(homework)
//                            print("success?")
//                        }
//                        for i in 0..<appData.shared.toDoList.count{
//                            if appData.shared.toDoList[i].uid == homework.uid {
//                                appData.shared.toDoList.remove(at: i)
//                            }
//                        }
//                        dismiss()
//                    }
                    //.buttonStyle(.glassProminent)
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomeworkDetailView(homework: Homework(homeworkType: "N/A", homeworkName: "N/A", homeworkRating: -1, homeworkDifficulty: -1, subject: "N/A", dueDate: Date.distantPast, timeSpent: 0))
}
