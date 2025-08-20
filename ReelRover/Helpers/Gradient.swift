//
//  Gradient.swift
//  ReelRover
//
//  Created by Maxim Golovlev on 20.08.2025.
//

import SwiftUI

struct BGGradient: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.app.gradientStart, Color.app.gradientEnd]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}
