//
//  ContentView.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/26/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Today's homework")
                .font(.custom("Georgia", size: 40, relativeTo: .headline))
            Text("\(Date.now.formatted(date: .abbreviated, time: .omitted))")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
