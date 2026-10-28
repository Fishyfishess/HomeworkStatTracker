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
    var toDoList: [String] = ["hi","he","ho"]
}

struct ContentView: View {
    @State var dailyQuotes: [String] = ["hey"]
    //@State var toDoList: [String] = ["hi","he","ho"]
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
                                ForEach(appData.shared.toDoList, id:\.self){ homework in
                                    NavigationLink(homework) {
                                    }
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .padding()
                    }
                    Tab("add", systemImage: "plus") {
                        addHomework()
                    }
                    Tab("upload", systemImage: "square.and.arrow.up") {
                        uploadHomework()
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
