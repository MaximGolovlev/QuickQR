//
//  ContentView.swift
//  ReelRover
//
//  Created by Maxim Golovlev on 20.08.2025.
//


import SwiftUI

struct ContentView: View {
    
    private var qrViewModel = QRGeneratorViewModel()
    private var historyViewModel = HistoryViewModel()
    
    var body: some View {
        TabView {
            QRGeneratorView()
                .environmentObject(qrViewModel)
                .environmentObject(historyViewModel)
                .tabItem {
                    Label("Generator", systemImage: "qrcode")
                }
            
            HistoryView()
                .environmentObject(historyViewModel)
                .tabItem {
                    Label("History", systemImage: "clock")
                }
        }
    }
}

struct QRGenerator_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
