//
//  AppColors.swift
//  ReelRover
//
//  Created by Maxim Golovlev on 20.08.2025.
//


// Resources/AppColors.swift
import SwiftUI

struct AppColors {
    // MARK: - Основные темы
    enum Theme: String, CaseIterable {
        case light
        case dark
        case blue
        case green
        case purple
        case orange
    }
    
    init() {
        AppColors.currentTheme = Self.loadTheme()
    }
    
    // Текущая тема (можно менять динамически)
    static var currentTheme: Theme = .dark
    
    // MARK: - Основные цвета градиента
    static var gradientStart: Color {
        switch currentTheme {
        case .light: return Color.blue.opacity(0.1)
        case .dark: return Color.purple.opacity(0.2)
        case .blue: return Color.blue.opacity(0.3)
        case .green: return Color.green.opacity(0.2)
        case .purple: return Color.purple.opacity(0.3)
        case .orange: return Color.orange.opacity(0.2)
        }
    }
    
    static var gradientEnd: Color {
        switch currentTheme {
        case .light: return Color.purple.opacity(0.1)
        case .dark: return Color.indigo.opacity(0.3)
        case .blue: return Color.cyan.opacity(0.2)
        case .green: return Color.mint.opacity(0.3)
        case .purple: return Color.pink.opacity(0.2)
        case .orange: return Color.red.opacity(0.1)
        }
    }
    
    // MARK: - Цвета фонов
    static var contentBackground: Color {
        switch currentTheme {
        case .light: return Color(.secondarySystemBackground)
        case .dark: return Color(.systemGray6)
        case .blue: return Color.blue.opacity(0.05)
        case .green: return Color.green.opacity(0.05)
        case .purple: return Color.purple.opacity(0.05)
        case .orange: return Color.orange.opacity(0.05)
        }
    }
    
    static var cardBackground: Color {
        switch currentTheme {
        case .light: return Color(.secondarySystemGroupedBackground)
        case .dark: return Color(.systemGray5)
        case .blue: return Color.white.opacity(0.9)
        case .green: return Color.white.opacity(0.9)
        case .purple: return Color.white.opacity(0.9)
        case .orange: return Color.white.opacity(0.9)
        }
    }
    
    static var whiteBackground: Color {
        Color.white
    }
    
    // MARK: - Цвета текста
    static var primaryText: Color {
        switch currentTheme {
        case .light: return Color.primary
        case .dark: return Color.white
        case .blue: return Color.blue
        case .green: return Color.green
        case .purple: return Color.purple
        case .orange: return Color.orange
        }
    }
    
    static var secondaryText: Color {
        switch currentTheme {
        case .light: return Color.secondary
        case .dark: return Color.gray
        case .blue: return Color.blue.opacity(0.7)
        case .green: return Color.green.opacity(0.7)
        case .purple: return Color.purple.opacity(0.7)
        case .orange: return Color.orange.opacity(0.7)
        }
    }
    
    static var accentText: Color {
        switch currentTheme {
        case .light: return Color.blue
        case .dark: return Color.cyan
        case .blue: return Color.cyan
        case .green: return Color.mint
        case .purple: return Color.pink
        case .orange: return Color.red
        }
    }
    
    // MARK: - Цвета кнопок и акцентов
    static var buttonPrimary: Color {
        switch currentTheme {
        case .light: return Color.blue
        case .dark: return Color.purple
        case .blue: return Color.blue
        case .green: return Color.green
        case .purple: return Color.purple
        case .orange: return Color.orange
        }
    }
    
    static var buttonSecondary: Color {
        switch currentTheme {
        case .light: return Color(.systemGray5)
        case .dark: return Color(.systemGray4)
        case .blue: return Color.blue.opacity(0.2)
        case .green: return Color.green.opacity(0.2)
        case .purple: return Color.purple.opacity(0.2)
        case .orange: return Color.orange.opacity(0.2)
        }
    }
    
    // MARK: - Тени
    static var shadowLight: Color {
        Color.black.opacity(0.1)
    }
    
    static var shadowMedium: Color {
        Color.black.opacity(0.2)
    }
    
    static var shadowDark: Color {
        Color.black.opacity(0.3)
    }
    
    // MARK: - Границы
    static var borderLight: Color {
        switch currentTheme {
        case .light: return Color.gray.opacity(0.3)
        case .dark: return Color.white.opacity(0.2)
        case .blue: return Color.blue.opacity(0.3)
        case .green: return Color.green.opacity(0.3)
        case .purple: return Color.purple.opacity(0.3)
        case .orange: return Color.orange.opacity(0.3)
        }
    }
    
    static var borderMedium: Color {
        switch currentTheme {
        case .light: return Color.gray.opacity(0.5)
        case .dark: return Color.white.opacity(0.4)
        case .blue: return Color.blue.opacity(0.5)
        case .green: return Color.green.opacity(0.5)
        case .purple: return Color.purple.opacity(0.5)
        case .orange: return Color.orange.opacity(0.5)
        }
    }
    
    // MARK: - Дополнительные акцентные цвета
    static var success: Color {
        Color.green
    }
    
    static var warning: Color {
        Color.orange
    }
    
    static var error: Color {
        Color.red
    }
    
    static var info: Color {
        Color.blue
    }
    
    // MARK: - Специальные градиенты
    static var primaryGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [gradientStart, gradientEnd]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    static var buttonGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [buttonPrimary, buttonPrimary.opacity(0.8)]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

// Extension для удобного доступа
extension Color {
    static let app = AppColors.self
}

// Утилиты для быстрой смены темы
extension AppColors {
    static func setTheme(_ theme: Theme) {
        currentTheme = theme
        // Здесь можно добавить уведомление об изменении темы
        NotificationCenter.default.post(name: NSNotification.Name("ThemeChanged"), object: nil)
    }
    
    static func toggleTheme() {
        currentTheme = (currentTheme == .light) ? .dark : .light
        NotificationCenter.default.post(name: NSNotification.Name("ThemeChanged"), object: nil)
    }
}

// Extension для View модификаторов
extension View {
    func appBackground() -> some View {
        self.background(
            LinearGradient(
                gradient: Gradient(colors: [AppColors.gradientStart, AppColors.gradientEnd]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        )
    }
    
    func appCardBackground(opacity: Double = 0.9) -> some View {
        self.background(
            AppColors.cardBackground
                .opacity(opacity)
                .cornerRadius(16)
        )
    }
    
    func appShadow() -> some View {
        self.shadow(color: AppColors.shadowLight, radius: 4, x: 0, y: 2)
    }
}

extension AppColors {
    
    static func loadTheme() -> AppColors.Theme {
        if let str = UserDefaults.standard.string(forKey: "AppColors.Theme") {
            return AppColors.Theme(rawValue: str) ?? .dark
        }
        return .dark
    }
    
    static func saveTheme(theme: AppColors.Theme) {
        UserDefaults.standard.set(theme.rawValue, forKey: "AppColors.Theme")
    }
    
}
