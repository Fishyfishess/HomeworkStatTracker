//
//  settingsView.swift
//  MyApp
//
//  Created by Alvin Wei on 11/18/26.
//

import SwiftUI


struct settingsView: View {
    var body: some View {
        NavigationStack{
            Text("Settings")
                .font(.custom("Georgia", size: 40, relativeTo: .headline))
            Spacer()
            NavigationLink("view past entries"){
                List {
                    ForEach(appData.shared.subjects, id:\.subject){ subject in
                        NavigationLink("\(subject.subject)"){
                            List {
                                ForEach(subject.homework, id:\.dueDate){ homework in
                                    NavigationLink("\(homework.homeworkName)") {
                                        Text("\(homework.homeworkName) (\(homework.homeworkType))")
                                            .font(.custom("Georgia", size: 40, relativeTo: .headline))
                                        Spacer()
                                        Text("homework type: \(homework.homeworkType)")
                                            .font(.custom("Georgia", size: 20, relativeTo: .headline))
                                        Text("homework Rating: \(homework.homeworkRating)")
                                            .font(.custom("Georgia", size: 20, relativeTo: .headline))
                                        Text("homework Difficulty: \(homework.homeworkDifficulty)")
                                            .font(.custom("Georgia", size: 20, relativeTo: .headline))
                                        Text("homework due date: \(homework.dueDate.formatted(date: .abbreviated, time: .omitted))")
                                            .font(.custom("Georgia", size: 20, relativeTo: .headline))
                                        Text("homework time spent: \(homework.timeSpent)")
                                            .font(.custom("Georgia", size: 20, relativeTo: .headline))
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .buttonStyle(.glassProminent)
            Spacer()
        }
    }
}

#Preview {
    settingsView()
}
