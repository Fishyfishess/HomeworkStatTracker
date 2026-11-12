//
//  uploadHomework.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/27/26.
//

import SwiftUI

struct uploadHomeworkView: View {
    @State var selectedSubject = "--"
    @State var selectedHomeworkType = "--"
    @State var selectedDueDate = Date.now
    @State var homeworkName = ""
    @State var selectedPersonalDifficulty = "--"
    @State var selectedhomeworkRating = "--"
    @State var selectedTimeSpent = ""
    @State var intPlsAlert = false
    @State var plsEnterAllFields = false
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
                            .frame(width: 235, height: 50)
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
                            .frame(width: 125)
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
                            .frame(width: 125)
                            .padding()
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .foregroundStyle(.black)
                    }
                }
                
                HStack{
                    Label("Time spent:", image: "")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .labelStyle(.titleOnly)
                        .padding()
                    
                    TextField("Time spent (in minutes)", text: $selectedTimeSpent)
                        .frame(width: 190)
                        .padding()
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            Spacer()
            Button("Upload Homework"){
                if homeworkName != "" && selectedSubject != "--" && selectedHomeworkType != "--" && selectedPersonalDifficulty != "--" && selectedhomeworkRating != "--" && selectedTimeSpent != "" {
                    if let x = Int(selectedTimeSpent){
                        let tempRating = Int(selectedhomeworkRating) ?? -1
                        let tempDifficulty = Int(selectedPersonalDifficulty) ?? -1
                        if tempRating != -1 && tempDifficulty != -1 {
                            let temp = Homework(homeworkType: selectedHomeworkType, homeworkName: homeworkName, homeworkRating: tempRating, homeworkDifficulty: tempDifficulty, subject: selectedSubject, dueDate: selectedDueDate, timeSpent: x)
                            print(selectedSubject)
                            if let a = appData.shared.subjects[selectedSubject]{
                                a.homework.append(temp)
                            }
                            print("success?")
                            
                            selectedSubject = "--"
                            selectedHomeworkType = "--"
                            selectedDueDate = Date.now
                            homeworkName = ""
                            selectedPersonalDifficulty = "--"
                            selectedhomeworkRating = "--"
                            selectedTimeSpent = ""
                        }
                    } else {
                        intPlsAlert.toggle()
                    }
                } else {
                    plsEnterAllFields.toggle()
                }
            }
            .buttonStyle(.glassProminent)
            
            Button("testing"){
                let temp = Homework(homeworkType: "Essay", homeworkName: "essay ahh", homeworkRating: 5, homeworkDifficulty: 5, subject: "English", dueDate: selectedDueDate, timeSpent: 50)
                let temp1 = Homework(homeworkType: "Essay", homeworkName: "essay ahh", homeworkRating: 4, homeworkDifficulty: 4, subject: "English", dueDate: selectedDueDate, timeSpent: 50)
                let temp2 = Homework(homeworkType: "Essay", homeworkName: "essay ahh", homeworkRating: 3, homeworkDifficulty: 3, subject: "English", dueDate: selectedDueDate, timeSpent: 50)
                let temp3 = Homework(homeworkType: "Essay", homeworkName: "essay ahh", homeworkRating: 2, homeworkDifficulty: 2, subject: "English", dueDate: selectedDueDate, timeSpent: 50)
                let temp4 = Homework(homeworkType: "Essay", homeworkName: "essay ahh", homeworkRating: 1, homeworkDifficulty: 1, subject: "English", dueDate: selectedDueDate, timeSpent: 40)
                if let a = appData.shared.subjects["English"]{
                    a.homework.append(temp)
                    a.homework.append(temp1)
                    a.homework.append(temp2)
                    a.homework.append(temp3)
                    a.homework.append(temp4)

                }
            }
        }
        .padding()
        .alert("Please enter a number for time spent", isPresented: $intPlsAlert) {
            
        }
        .alert("Please fill out every field", isPresented: $plsEnterAllFields){
            
        }
    }
}

#Preview {
    uploadHomeworkView()
}
