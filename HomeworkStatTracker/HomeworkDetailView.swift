//
//  HomeworkDetailView.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/30/26.
//

import SwiftUI
import Foundation
import SwiftData

struct HomeworkDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    @Binding var subjectsPersistance : [Subject]
    @Binding var homeworksPersistance : [Homework]
    @State var homework : Homework
    @State var thisRating = "--"
    @State var thisDifficulty = "--"
    @State var thisTimeSpent = ""
    @State var submit = false
    @State var intPlsAlert = false
    @State var plsEnterAllFields = false
    @State var rating = -1.0
    @State var difficulty = -1.0
    @State var timeSpent = -1.0
    var body: some View {
        NavigationStack{
            VStack{
                Text("\(homework.homeworkName) (\(homework.homeworkType))")
                    .font(.custom("Georgia", size: 40, relativeTo: .headline))
                    .multilineTextAlignment(.center)
                Text("Due date: \(homework.dueDate.formatted(date: .abbreviated, time: .omitted))")
                    .font(.custom("Georgia", size: 20, relativeTo: .headline))
                Text("Subject: \(homework.subject)")
                    .font(.custom("Georgia", size: 20, relativeTo: .headline))
                Spacer()
                Text("Statistics for this homework type below:")
                    .font(.custom("Georgia", size: 30, relativeTo: .headline))
                Spacer()
                if rating == 0 {
                    Text("Not enough data to show stats. Will be avaliable once enough homework of this type is submitted")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .multilineTextAlignment(.center)
                } else {
                    Text("Average personal rating: \((rating).formatted(.number.precision(.fractionLength(2))))")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                    Text("Average personal difficulty: \((difficulty).formatted(.number.precision(.fractionLength(2))))")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                    Text("Average  time spent: \((timeSpent).formatted(.number.precision(.fractionLength(2))))")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                }
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
                        Button("Finish"){
                            if thisRating != "--" && thisDifficulty != "--" && thisTimeSpent != ""{
                                if let z = Int(thisTimeSpent){
                                    if let x = Int(thisRating) {
                                        homework.homeworkRating = x
                                    }
                                    if let y = Int(thisDifficulty) {
                                        homework.homeworkDifficulty = y
                                    }
                                    homework.timeSpent = z
                                    for subject in subjectsPersistance {
                                        if subject.subject == homework.subject{
                                            subject.homework.append(homework)
                                        }
                                    }
                                    for i in 0..<homeworksPersistance.count{
                                        if homeworksPersistance[i].uid == homework.uid {
                                            homeworksPersistance.remove(at: i)
                                        }
                                    }
                                    dismiss()
                                } else {
                                    intPlsAlert.toggle()
                                }
                            } else {
                                plsEnterAllFields.toggle()
                            }
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
            .alert("Please enter a number for time spent", isPresented: $intPlsAlert) {
                
            }
            .alert("Please fill out every field", isPresented: $plsEnterAllFields){
                
            }
            .onAppear {
                for subject in subjectsPersistance {
                    if subject.subject == homework.subject{
                        rating = subject.analyzeRating(homeworkType: homework.homeworkType)
                        difficulty = subject.analyzeDifficulty(homeworkType: homework.homeworkType)
                        timeSpent = subject.analyzeTimeSpent(homeworkType: homework.homeworkType)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeworkDetailView(subjectsPersistance: .constant([Subject(subject: "N/A")]) ,homeworksPersistance: .constant([Homework(homeworkType: "N/A", homeworkName: "N/A", homeworkRating: 0, homeworkDifficulty: 0, subject: "N/A", dueDate: Date.now, timeSpent: 0)]), homework: Homework(homeworkType: "N/A", homeworkName: "N/A", homeworkRating: 2, homeworkDifficulty: 3, subject: "N/A", dueDate: Date.distantPast, timeSpent: 0))
}
