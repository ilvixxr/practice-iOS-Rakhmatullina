//
//  MainView.swift
//  MoodApp
//
//  Created by Ilvina on 01.07.2026.
//

import SwiftUI

struct MainView: View {
    @Environment(MoodViewModel.self) var viewModel
    @AppStorage("userName") var userName: String = ""
    @State var showAddSheet = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                SectionCard(title: "Привет, \(userName)!") {
                }
                
                SectionCard(title: "Мои записи") {
                    if viewModel.entries.isEmpty {
                        Text("Пока нет записей")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        List {
                            ForEach(viewModel.entries) { entry in
                                HStack {
                                    if entry.mood == .happy {
                                        Text("😊")
                                    } else if entry.mood == .neutral {
                                        Text("😐")
                                    } else {
                                        Text("😔")
                                    }
                                    
                                    Text(entry.date, style: .date)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            .onDelete { offsets in
                                viewModel.deleteEntry(at: offsets)
                            }
                        }
                        .listStyle(.plain)
                        .frame(height: 300)
                    }
                }
                PrimaryButton(title: "Добавить запись") {
                    showAddSheet = true
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.vertical)
            .sheet(isPresented: $showAddSheet) {
                AddMoodView()
            }
        }
    }
}
