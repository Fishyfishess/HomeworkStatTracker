//
//  ContentView.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/26/26.
//

import SwiftUI

@Observable
class appData{
    static var shared = appData()
    private init(){
    }
    var toDoList: [Homework] = []
    var subjects : [String : Subject] = ["English": Subject(), "Math" : Subject(), "Computer cience" : Subject(), "Science" : Subject(), "Social science" : Subject()]
}

struct ContentView: View {
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
                                        NavigationLink("\(homework.homeworkName) \(homework.dueDate.formatted(date: .abbreviated, time: .omitted))") {
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
        }
    }
}

#Preview {
    ContentView()
}
