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
        NavigationStack {
            Group {
                switch viewModel.state {
                case .idle, .loading:
                    VStack(spacing: 16) {
                        ProgressView()
                        Text("Загружаем...")
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                case .error(let message):
                    VStack(spacing: 16) {
                        Text("Ошибка")
                            .font(.largeTitle)
                        Text(message)
                            .foregroundStyle(.secondary)
                        Button("Попробовать снова") {
                            Task { await viewModel.loadEntries() }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                case .success:
                    mainContent
                }
            }
            .navigationTitle("Дневник")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: MoodEntry.self) { entry in
                MoodDetailView(entry: entry)
            }
            .task {
                await viewModel.loadEntries()
            }
            .sheet(isPresented: $showAddSheet) {
                AddMoodView()
            }
        }
    }
    
    var mainContent: some View {
        @Bindable var bindableViewModel = viewModel
        
        return ScrollView {
            VStack(spacing: 10) {
                SectionCard(title: "Привет, \(userName)!") {
                    if viewModel.allEntries.isEmpty {
                        Text("Нет записей")
                            .foregroundColor(.gray)
                    } else {
                        Text("Всего записей: \(viewModel.allEntries.count)")
                            .foregroundColor(.gray)
                    }
                }
                
                SectionCard(title: "Мои записи") {
                    if viewModel.filteredEntries.isEmpty {
                        Text(viewModel.searchQuery.isEmpty ? "Пока нет записей" : "Ничего не найдено")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        let columns = [GridItem(.flexible()), GridItem(.flexible())]
                        
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.filteredEntries) { entry in
                                NavigationLink(value: entry) {
                                    VStack(spacing: 8) {
                                        Text(entry.mood.emoji)
                                            .font(.largeTitle)
                                        
                                        Text(entry.date, style: .date)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(12)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .padding(.vertical)
        }
        .searchable(text: $bindableViewModel.searchQuery, prompt: "Поиск по смайлику")
    }
}
