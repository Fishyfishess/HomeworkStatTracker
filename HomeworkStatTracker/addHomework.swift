//
//  addHomework.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/27/26.
//

import SwiftUI

struct addHomework: View {
    @State var selectedSubject = "Pick subject"
    @State var selectedHomeworkType = "Pick homework type"
    @State var selectedDueDate = Date.now
    @State var homeworkName = ""
    var body: some View {
        VStack{
            Text("Add new homework")
                .font(.custom("Georgia", size: 40, relativeTo: .headline))
            Spacer()
            VStack(alignment: .leading){
                HStack{
                    Label("Homework Name:", image: "")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .labelStyle(.titleOnly)
                        .padding()
                    
                    TextField("Homework", text: $homeworkName)
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
                        Button("math"){
                            selectedSubject = "math"
                        }
                    } label: {
                        Label(selectedSubject, image: "")
                            .padding()
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .foregroundStyle(.black)
                            .labelStyle(.titleOnly)
                    }
                }
                
                HStack{
                    Label("Homework Type:", image: "")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .labelStyle(.titleOnly)
                        .padding()
                    
                    Menu {
                        Button("Webassign"){
                            selectedHomeworkType = "Webassign"
                        }
                    } label: {
                        Label(selectedHomeworkType, image: "")
                            .padding()
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .foregroundStyle(.black)
                            .labelStyle(.titleOnly)
                    }
                }
                
                HStack{
                    Label("Due Date: ", image: "")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .labelStyle(.titleOnly)
                        .padding()
                    
                    DatePicker("", selection: $selectedDueDate, displayedComponents: .date)
                        .labelsHidden()
                }
            }
            Spacer()
            Button("Add Homework"){
                var temp = Homework(homeworkType: selectedHomeworkType, homeworkName: homeworkName, homeworkRating: -1, homeworkDifficulty: -1, subject: selectedSubject, dueDate: selectedDueDate)
                appData.shared.toDoList.append(temp)
            }
            .buttonStyle(.glassProminent)
        }
        .padding()
    }
}

#Preview {
    addHomework()
}
