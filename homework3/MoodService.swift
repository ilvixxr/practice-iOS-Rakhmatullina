//
//  MoodService.swift
//  MoodApp
//
//  Created by Ilvina on 01.07.2026.
//

import Foundation
struct MoodService {
    static func fetchEntries() async throws -> [MoodEntry] {
        try await Task.sleep(for: .seconds(1))
        return []
    }
}
