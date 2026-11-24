//
//  ContentView.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/26/26.
//

import SwiftUI
import SwiftData
@Observable
//@Model
class appData{
    static var shared = appData()
    private init(){
    }
    var toDoList: [Homework] = []
    var subjects : [Subject] = [Subject(subject: "English"), Subject(subject: "Math"), Subject(subject: "Computer science"), Subject(subject: "Science"), Subject(subject: "Social science")]
    var saved = false
}

struct ContentView: View {
    @State var dailyQuotes: [String] = ["hey"]
    //@Environment(\.modelContext) var context
    //@Query var Data: [appData]
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
                        .onAppear{
//                            if !appData.shared.saved {
//                                context.insert(appData.shared)
//                                appData.shared.saved = true
//                            }
//                            appData.shared = Data[0]
                        }
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
        }
    }
}

#Preview {
    ContentView()
}
