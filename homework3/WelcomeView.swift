//
//  WelcomeView.swift
//  MoodApp
//
//  Created by Ilvina on 01.07.2026.
//

import SwiftUI

struct WelcomeView: View {
    @AppStorage("userName") var userName: String = ""
    @State var tempName: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
        
            Text("Mood Tracker")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            SectionCard(title: "Как тебя зовут?") {
                
                TextField("Введите имя", text: $tempName)
                    .textFieldStyle(.roundedBorder)
                
                PrimaryButton(title: "Начать") {
                    if tempName != "" {
                        userName = tempName
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
    }
}
#Preview {
    WelcomeView()
}
