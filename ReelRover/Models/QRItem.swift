//
//  QRItem.swift
//  ReelRover
//
//  Created by Maxim Golovlev on 20.08.2025.
//


import Foundation

struct QRItem: Identifiable, Codable, Hashable {
    let id: UUID
    let content: String
    let date: Date
    
    init(content: String, date: Date = Date()) {
        self.id = UUID()
        self.content = content
        self.date = date
    }
}