//
//  ContentView.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/26/26.
//

import SwiftUI
import SwiftData
//@Observable
//@Model
//class appData{
//    static var shared = appData()
//    private init(){
//    }
//    //var toDoList: [Homework] = []
//    //var subjects : [Subject] = [Subject(subject: "English"), Subject(subject: "Math"), Subject(subject: "Computer science"), Subject(subject: "Science"), Subject(subject: "Social science")]
//}

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Query var subjects: [Subject]
    @Query var Homeworks: [Homework]
    
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
                                if Homeworks.isEmpty{
                                    Spacer()
                                        .listRowBackground(Color.clear)
                                } else {
                                    ForEach(Homeworks, id:\.dueDate){ homework in
                                        NavigationLink("\(homework.homeworkName) | Due:  \(homework.dueDate.formatted(date: .abbreviated, time: .omitted))") {
                                            HomeworkDetailView(subjectsPersistance: .constant(subjects), homeworksPersistance: .constant(Homeworks), homework: homework)
                                        }
                                    }
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .padding()
                        .onAppear {
//                            do {
//                                try context.delete(model: Subject.self)
//                                try context.delete(model: Homework.self)
//                            } catch {
//                                
//                            }
//                            print(appData.shared.subjects.count)
//                            print(subjects.count)
//                            for subject in appData.shared.subjects {
//                                context.insert(subject)
//                                print(subject.subject)
//                                try? context.save()
//                                print(subjects)
//                            }
//                            for homework in appData.shared.toDoList {
//                                context.insert(homework)
//                                print(homework.homeworkName)
//                                try? context.save()
//                                print(Homeworks)
//                            }
                            if subjects.count == 0{
                                context.insert(Subject(subject: "English"))
                                context.insert(Subject(subject: "Math"))
                                context.insert(Subject(subject: "Computer science"))
                                context.insert(Subject(subject: "Science"))
                                context.insert(Subject(subject: "Social science"))
                                try? context.save()
                            }
//                            appData.shared.toDoList = Homeworks
//                            appData.shared.subjects = subjects
                            print(Homeworks.count)
                            //print(appData.shared.subjects.count)
                            print(subjects.count)
                            for i in 0..<Homeworks.count{
                                print(Homeworks[i].uid)
                            }
                            
                        }
                        Button("delete pers"){
                            do {
                                try context.delete(model: Subject.self)
                                try context.delete(model: Homework.self)
                            } catch {

                            }
                        }
                    }
                    Tab("Add", systemImage: "plus") {
                        addHomeworkView()
                    }
                    Tab("Upload", systemImage: "square.and.arrow.up") {
                        uploadHomeworkView(subjectsPersistance: .constant(subjects), homeworksPersistance: .constant(Homeworks))
                    }
                    Tab("Settings", systemImage: "gearshape.fill"){
                        settingsView()
                    }
                }
//                .onAppear {
//                    do {
//                        try context.delete(model: Subject.self)
//                        try context.delete(model: Homework.self)
//                    } catch {
//                        
//                    }
//                    for subject in appData.shared.subjects {
//                        context.insert(subject)
//                        print(subject.subject)
//                        try? context.save()
//                        print(subjects)
//                    }
//                    for homework in appData.shared.toDoList {
//                        context.insert(homework)
//                        print(homework.homeworkName)
//                        try? context.save()
//                        print(Homeworks)
//                    }
//                    appData.shared.toDoList = Homeworks
//                    appData.shared.subjects = subjects
//                    //print(Homework.count)
//                    print(appData.shared.subjects.count)
//                    print(subjects.count)
//                    
//                }
        }
    }
}

#Preview {
    ContentView()
}
