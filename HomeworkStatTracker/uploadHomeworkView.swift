//
//  uploadHomework.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/27/26.
//

import SwiftUI

struct uploadHomework: View {
    @State var selectedSubject = "--"
    @State var selectedHomeworkType = "--"
    @State var selectedDueDate = Date.now
    @State var homeworkName = ""
    @State var selectedPersonalDifficulty = "--"
    @State var selectedhomeworkRating = "--"
    var body: some View {
        VStack{
            Text("Upload old homework")
                .font(.custom("Georgia", size: 40, relativeTo: .headline))
            Spacer()
            VStack(alignment: .leading){
                HStack{
                    Label("Homework Name:", image: "")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .labelStyle(.titleOnly)
                        .padding()
                    
                    TextField("Homework", text: $homeworkName)
                        .frame(width: 135)
                        .padding()
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                HStack{
                    Label("Subject:", image: "")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .labelStyle(.titleOnly)
                        .padding()
                    
                    Menu {
                        Button("English"){
                            selectedSubject = "English"
                        }
                        Button("Math"){
                            selectedSubject = "Math"
                        }
                        Button("Science"){
                            selectedSubject = "Science"
                        }
                        Button("Social sciences"){
                            selectedSubject = "Social science"
                        }
                        Button("Computer science"){
                            selectedSubject = "Computer science"
                        }
                    } label: {
                        Label(selectedSubject, systemImage: "chevron.down")
                            .frame(width: 225)
                            .padding()
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .foregroundStyle(.black)
                    }
                }
                
                HStack{
                    Label("Homework Type:", image: "")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .labelStyle(.titleOnly)
                        .padding()
                    
                    Menu {
                        if selectedSubject == "English" {
                            Button("Essay"){
                                selectedHomeworkType = "Essay"
                            }
                        } else if selectedSubject == "Math" {
                            Button("Webassign"){
                                selectedHomeworkType = "Webassign"
                            }
                        } else if selectedSubject == "Science" {
                            Button("Worksheet"){
                                selectedHomeworkType = "Worksheet"
                            }
                        } else if selectedSubject == "Social science" {
                            Button("Reading"){
                                selectedHomeworkType = "Reading"
                            }
                        } else if selectedSubject == "Computer science" {
                            Button("kill the bugs"){
                                selectedHomeworkType = "kill the bugs"
                            }
                        } else {
                            Text("select a subject first")
                        }
                    } label: {
                        Label(selectedHomeworkType, systemImage: "chevron.down")
                            .frame(width: 140)
                            .padding()
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .foregroundStyle(.black)
                    }
                }
                
                HStack{
                    Label("Due Date: ", image: "")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .labelStyle(.titleOnly)
                        .padding()
                    ZStack{
                        DatePicker("", selection: $selectedDueDate, displayedComponents: .date)
                            .frame(width: 230, height: 50)
                            .labelsHidden()
                            .blendMode(.destinationOver)
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay {
                                Label(selectedDueDate.formatted(date: .abbreviated, time: .omitted), systemImage: "chevron.down")
                            }
                    }
                }
                
                HStack{
                    Label("Personal Difficulty:", image: "")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .labelStyle(.titleOnly)
                        .padding()
                    
                    Menu {
                        Button("5"){
                            selectedPersonalDifficulty = "5"
                        }
                        Button("4"){
                            selectedPersonalDifficulty = "4"
                        }
                        Button("3"){
                            selectedPersonalDifficulty = "3"
                        }
                        Button("2"){
                            selectedPersonalDifficulty = "2"
                        }
                        Button("1"){
                            selectedPersonalDifficulty = "1"
                        }
                    } label: {
                        Label(selectedPersonalDifficulty, systemImage: "chevron.down")
                            .frame(width: 120)
                            .padding()
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .foregroundStyle(.black)
                    }
                }
                
                HStack{
                    Label("Homework Rating:", image: "")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .labelStyle(.titleOnly)
                        .padding()
                    
                    Menu {
                        Button("5"){
                            selectedhomeworkRating = "5"
                        }
                        Button("4"){
                            selectedhomeworkRating = "4"
                        }
                        Button("3"){
                            selectedhomeworkRating = "3"
                        }
                        Button("2"){
                            selectedhomeworkRating = "2"
                        }
                        Button("1"){
                            selectedhomeworkRating = "1"
                        }
                    } label: {
                        Label(selectedhomeworkRating, systemImage: "chevron.down")
                            .frame(width: 120)
                            .padding()
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .foregroundStyle(.black)
                    }
                }
            }
            Spacer()
            Button("Add Homework"){
                let temp = Homework(homeworkType: selectedHomeworkType, homeworkName: homeworkName, homeworkRating: -1, homeworkDifficulty: -1, subject: selectedSubject, dueDate: selectedDueDate)
                if let index = appData.shared.subject.homeworkType[selectedSubject]{
                    print(selectedSubject)
                    print(String(index))
                    appData.shared.subject.homework[index].append(temp)
                    print("success?")
                    print(appData.shared.subject.homework[index])
                }
            }
            .buttonStyle(.glassProminent)
        }
        .padding()
    }
}

#Preview {
    uploadHomework()
}
