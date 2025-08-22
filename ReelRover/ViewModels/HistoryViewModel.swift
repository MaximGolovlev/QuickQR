//
//  HistoryViewModel.swift
//  ReelRover
//
//  Created by Maxim Golovlev on 20.08.2025.
//


import Foundation

class HistoryViewModel: ObservableObject {
    @Published var historyItems: [QRItem] = []
    private let saveKey = "SavedQRItems"
    
    init() {
        loadItems()
    }
    
    func addItem(_ item: QRItem) {
        historyItems.insert(item, at: 0)
        saveItems()
    }
    
    func deleteItem(at indexSet: IndexSet) {
        historyItems.remove(atOffsets: indexSet)
        saveItems()
    }
    
    func deleteItems() {
        historyItems.removeAll()
        saveItems()
    }
    
    private func saveItems() {
        if let encoded = try? JSONEncoder().encode(historyItems) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func loadItems() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([QRItem].self, from: data) {
                historyItems = decoded
            }
        }
    }
}
