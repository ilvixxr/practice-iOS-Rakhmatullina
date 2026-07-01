//
//  MoodEntry.swift
//  MoodApp
//
//  Created by Ilvina on 01.07.2026.
//

import Foundation

enum Mood: String, CaseIterable {
    case happy = "😊"
    case neutral = "😐"
    case sad = "😔"
    
    var emoji: String {
        return self.rawValue
    }
}

struct MoodEntry: Identifiable, Hashable {
    let id = UUID()
    let mood: Mood
    let date: Date
    
    init(mood: Mood, note: String? = nil) {
        self.mood = mood
        self.date = Date()
    }
}
