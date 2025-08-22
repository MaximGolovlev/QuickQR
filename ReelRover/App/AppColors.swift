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
    // Текущая тема (можно менять динамически)
    static var currentTheme: Theme = .blue
    
    // MARK: - Основные цвета градиента
    static var gradientStart: Color {
        switch currentTheme {
        case .light: return Color.blue.opacity(0.1)
        case .dark: return Color(red: 0.1, green: 0.0, blue: 0.2) // Темно-фиолетовый
        case .blue: return Color.blue.opacity(0.3)
        case .green: return Color.green.opacity(0.2)
        case .purple: return Color.purple.opacity(0.3)
        case .orange: return Color.orange.opacity(0.2)
        }
    }
    
    static var gradientEnd: Color {
        switch currentTheme {
        case .light: return Color.purple.opacity(0.1)
        case .dark: return Color(red: 0.0, green: 0.05, blue: 0.15) // Темно-синий
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
        case .dark: return Color(red: 0.08, green: 0.05, blue: 0.12) // Темный фиолетово-синий
        case .blue: return Color.blue.opacity(0.05)
        case .green: return Color.green.opacity(0.05)
        case .purple: return Color.purple.opacity(0.05)
        case .orange: return Color.orange.opacity(0.05)
        }
    }
    
    static var cardBackground: Color {
        switch currentTheme {
        case .light: return Color(.secondarySystemGroupedBackground)
        case .dark: return Color(red: 0.12, green: 0.08, blue: 0.18) // Более светлый фиолетовый
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
        case .dark: return Color(red: 0.9, green: 0.95, blue: 1.0) // Яркий голубовато-белый
        case .blue: return Color.blue
        case .green: return Color.green
        case .purple: return Color.purple
        case .orange: return Color.orange
        }
    }
    
    static var secondaryText: Color {
        switch currentTheme {
        case .light: return Color.secondary
        case .dark: return Color(red: 0.7, green: 0.75, blue: 0.9) // Светло-голубой
        case .blue: return Color.blue.opacity(0.7)
        case .green: return Color.green.opacity(0.7)
        case .purple: return Color.purple.opacity(0.7)
        case .orange: return Color.orange.opacity(0.7)
        }
    }
    
    static var accentText: Color {
        switch currentTheme {
        case .light: return Color.blue
        case .dark: return Color(red: 0.0, green: 1.0, blue: 1.0) // Яркий неоновый циан
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
        case .dark: return Color(red: 0.4, green: 0.0, blue: 0.8) // Неоновый фиолетовый
        case .blue: return Color.blue
        case .green: return Color.green
        case .purple: return Color.purple
        case .orange: return Color.orange
        }
    }
    
    static var buttonSecondary: Color {
        switch currentTheme {
        case .light: return Color(.systemGray5)
        case .dark: return Color(red: 0.2, green: 0.1, blue: 0.3) // Темный фиолетовый
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
        case .dark: return Color(red: 0.0, green: 0.5, blue: 0.8).opacity(0.4) // Неоновая синяя граница
        case .blue: return Color.blue.opacity(0.3)
        case .green: return Color.green.opacity(0.3)
        case .purple: return Color.purple.opacity(0.3)
        case .orange: return Color.orange.opacity(0.3)
        }
    }
    
    static var borderMedium: Color {
        switch currentTheme {
        case .light: return Color.gray.opacity(0.5)
        case .dark: return Color(red: 0.0, green: 0.8, blue: 1.0).opacity(0.6) // Яркая неоновая граница
        case .blue: return Color.blue.opacity(0.5)
        case .green: return Color.green.opacity(0.5)
        case .purple: return Color.purple.opacity(0.5)
        case .orange: return Color.orange.opacity(0.5)
        }
    }
    
    // MARK: - Дополнительные акцентные цвета
    static var success: Color {
        Color(red: 0.0, green: 1.0, blue: 0.4) // Неоновый зеленый
    }
    
    static var warning: Color {
        Color(red: 1.0, green: 0.8, blue: 0.0) // Неоновый желтый
    }
    
    static var error: Color {
        Color(red: 1.0, green: 0.2, blue: 0.4) // Неоновый красный
    }
    
    static var info: Color {
        Color(red: 0.0, green: 0.7, blue: 1.0) // Яркий голубой
    }
    
    // MARK: - Специальные неоновые эффекты
    static var neonPink: Color {
        Color(red: 1.0, green: 0.0, blue: 0.8)
    }
    
    static var neonBlue: Color {
        Color(red: 0.0, green: 0.6, blue: 1.0)
    }
    
    static var neonGreen: Color {
        Color(red: 0.2, green: 1.0, blue: 0.4)
    }
    
    static var neonPurple: Color {
        Color(red: 0.6, green: 0.0, blue: 1.0)
    }
}

// Extension для удобного доступа
extension Color {
    static let app = AppColors.self
}

// Extension для View модификаторов с неоновыми эффектами
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
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(AppColors.borderLight, lineWidth: 1)
                )
        )
    }
    
    func appShadow() -> some View {
        self.shadow(color: AppColors.shadowDark, radius: 8, x: 0, y: 4)
    }
    
    // Новый модификатор для неонового свечения
    func neonGlow(color: Color = AppColors.accentText, radius: CGFloat = 10) -> some View {
        self.shadow(color: color.opacity(0.8), radius: radius, x: 0, y: 0)
            .shadow(color: color.opacity(0.6), radius: radius * 1.5, x: 0, y: 0)
    }
    
    // Модификатор для неонового текста
    func neonText(color: Color = AppColors.accentText) -> some View {
        self.foregroundColor(color)
            .shadow(color: color.opacity(0.8), radius: 5, x: 0, y: 0)
    }
}
