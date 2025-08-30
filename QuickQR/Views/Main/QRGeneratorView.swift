//
//  QRGeneratorView.swift
//  ReelRover
//
//  Created by Maxim Golovlev on 20.08.2025.
//


import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRGeneratorView: View {
    @EnvironmentObject private var viewModel: QRGeneratorViewModel
    @EnvironmentObject private var historyModel: HistoryViewModel
    @FocusState private var isInputFocused: Bool
    @AppStorage("AppColors.Theme") private var selectedTheme: AppColors.Theme = .dark
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Фоновый градиент
                BGGradient()
                
                VStack(spacing: 24) {
                    // Заголовок
                    VStack(spacing: 8) {
                        Image(systemName: "qrcode")
                            .font(.system(size: 40))
                            .foregroundColor(.app.accentText)
                        
                        Text("Quick QR")
                            .font(.largeTitle.bold())
                            .foregroundColor(.app.primaryText)
                        
                        Text("Enter text to generate QR code")
                            .font(.subheadline)
                            .foregroundColor(.app.secondaryText)
                    }
                    .padding(.top, 32)
                    
                    // Поле ввода с кнопкой очистки
                    HStack {
                        TextField("Enter text or a URL", text: $viewModel.inputText)
                            .focused($isInputFocused)
                            .textFieldStyle(.roundedBorder)
                            .onChange(of: viewModel.inputText) { oldValue, newValue in
                                // Удаляем QR-код при изменении текста
                                if oldValue != newValue && viewModel.generatedImage != nil {
                                    viewModel.generatedImage = nil
                                }
                            }
                            .overlay(
                                HStack {
                                    Spacer()
                                    if !viewModel.inputText.isEmpty {
                                        Button(action: {
                                            viewModel.inputText = ""
                                            viewModel.generatedImage = nil
                                        }) {
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundColor(.app.secondaryText)
                                        }
                                        .padding(.trailing, 8)
                                    }
                                }
                            )
                            .submitLabel(.done)
                            .onSubmit {
                              //  generateAndSave()
                            }
                    }
                    .padding(.horizontal)
                    
                    // Кнопка генерации
                    Button(action: generateAndSave) {
                        HStack {
                            Image(systemName: "qrcode")
                            Text("Generate QR code")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.app.buttonPrimary)
                    .controlSize(.large)
                    .disabled(viewModel.inputText.isEmpty)
                    .padding(.horizontal)
                    
                    // Результат генерации
                    if let image = viewModel.generatedImage {
                        VStack(spacing: 16) {
                            Image(uiImage: image)
                                .interpolation(.none)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .shadow(radius: 8)
                                .padding()
                                .background(Color.app.whiteBackground)
                                .cornerRadius(16)
                                .shadow(radius: 4)
                            
                            Text("QR code saved to history")
                                .font(.footnote)
                                .foregroundColor(.green)
                        }
                        .transition(.scale.combined(with: .opacity))
                    }
                    
                    Spacer()
                }
                .animation(.easeInOut, value: viewModel.generatedImage)
            }
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                isInputFocused = false
            }
            .alert("Error", isPresented: $viewModel.showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.alertMessage)
            }
        }
    }
    
    private func generateAndSave() {
        isInputFocused = false
        viewModel.generateQRCode()
        
        // Автоматическое сохранение в историю
        if let _ = viewModel.generatedImage {
            let item = QRItem(content: viewModel.inputText)
            historyModel.addItem(item)
        }
    }
}
