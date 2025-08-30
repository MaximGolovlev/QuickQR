//
//  QRGeneratorViewModel.swift
//  ReelRover
//
//  Created by Maxim Golovlev on 20.08.2025.
//


import SwiftUI
import CoreImage.CIFilterBuiltins

class QRGeneratorViewModel: ObservableObject {
    @Published var inputText: String = ""
    @Published var generatedImage: UIImage?
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    private let context = CIContext()
    private let filter = CIFilter.qrCodeGenerator()
    
    func generateQRCode() {
        guard !inputText.trimmingCharacters(in: .whitespaces).isEmpty else {
            alertMessage = "Please enter some text"
            showAlert = true
            return
        }
        
        let data = Data(inputText.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                generatedImage = UIImage(cgImage: cgimg)
            }
        }
    }
}