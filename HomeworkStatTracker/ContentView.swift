//
//  ContentView.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/26/26.
//

import SwiftUI
import SwiftData
@Observable
class appData{
    static var shared = appData()
    private init(){
    }
    var toDoList: [Homework] = []
    var subjects : [Subject] = [Subject(subject: "English"), Subject(subject: "Math"), Subject(subject: "Computer science"), Subject(subject: "Science"), Subject(subject: "Social science")]
}

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Query var subjects: [Subject]
    @Query var Homework: [Homework]
    
    @State var dailyQuotes: [String] = ["hey"]
    var body: some View {
        NavigationStack{
                TabView {
                    Tab("Home", systemImage: "house") {
                        VStack {
                            Text("Today's homework")
                                .font(.custom("Georgia", size: 40, relativeTo: .headline))
                            Text("\(Date.now.formatted(date: .abbreviated, time: .omitted)) | \"\(dailyQuotes[0])\"")
                                .font(.custom("Georgia", size: 20, relativeTo: .headline))
                            List {
                                if appData.shared.toDoList.isEmpty{
                                    Spacer()
                                        .listRowBackground(Color.clear)
                                } else {
                                    ForEach(appData.shared.toDoList, id:\.dueDate){ homework in
                                        NavigationLink("\(homework.homeworkName) | Due:  \(homework.dueDate.formatted(date: .abbreviated, time: .omitted))") {
                                            HomeworkDetailView(homework: homework)
                                        }
                                    }
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .padding()
                    }
                    Tab("Add", systemImage: "plus") {
                        addHomeworkView()
                    }
                    Tab("Upload", systemImage: "square.and.arrow.up") {
                        uploadHomeworkView()
                    }
                    Tab("Settings", systemImage: "gearshape.fill"){
                        settingsView()
                    }
                }
                .onAppear {
                    for subject in appData.shared.subjects {
                        let J = subject
                        context.insert(J)
                        print(subject.subject)
                        try? context.save()
                        print(subjects)
                    }
                    for homework in appData.shared.toDoList {
                        context.insert(homework)
                        print(homework.homeworkName)
                        try? context.save()
                        print(Homework)
                    }
                    //print(Homework.count)
                    print(appData.shared.subjects.count)
                    print(subjects.count)
//                    appData.shared.toDoList = Homework
//                    appData.shared.subjects = subjects
                }
        }
    }
}

#Preview {
    ContentView()
}
