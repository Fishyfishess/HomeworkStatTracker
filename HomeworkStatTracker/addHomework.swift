//
//  addHomework.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/27/26.
//

import SwiftUI

struct addHomework: View {
    @State var selectedSubject = "Pick subject"
    var body: some View {
        Text("Add new homework")
            .font(.custom("Georgia", size: 40, relativeTo: .headline))
        HStack(){
            VStack(alignment: .leading){
                    Label("Subject:", image: "")
                    .font(.custom("Georgia", size: 20, relativeTo: .headline))
                    .labelStyle(.titleOnly)
            }
            .padding()
            VStack{
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
            .padding()
        }
    }
}

#Preview {
    addHomework()
}
