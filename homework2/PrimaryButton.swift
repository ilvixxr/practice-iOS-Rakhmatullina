//
//  PrimaryButton.swift
//  MoodApp
//
//  Created by Ilvina on 30.06.2026.
//
import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
#Preview {
    PrimaryButton(title: "Название"){
    }
}

