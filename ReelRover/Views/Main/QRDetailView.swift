//
//  QRDetailView.swift
//  ReelRover
//
//  Created by Maxim Golovlev on 20.08.2025.
//

import SwiftUI

struct QRDetailView: View {
    let item: QRItem
    let qrImage: UIImage?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
            ZStack {
                
                BGGradient()
                
                ScrollView {
                    scrollContent
                }
        }
        .navigationTitle("QR Code Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    shareQR()
                }) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
      //  .background(Color(.systemGroupedBackground))
    }
    
    private var scrollContent: some View {
        VStack(spacing: 24) {
            if let qrImage = qrImage {
                Image(uiImage: qrImage)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding()
                    .background(Color.app.whiteBackground)
                    .cornerRadius(16)
                    .shadow(radius: 8)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Content:")
                    .font(.headline)
                    .foregroundColor(.app.primaryText)
                
                Text(item.content)
                    .textSelection(.enabled)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(.tertiarySystemBackground))
                    .cornerRadius(12)
                    .font(.body)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Created on:")
                    .font(.headline)
                    .foregroundColor(.app.primaryText)
                
                Text(item.date.formatted(date: .long, time: .shortened))
                    .font(.subheadline)
                    .foregroundColor(.app.secondaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()
            
            Button(action: {
                shareQR()
            }) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("Share QR Code")
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.app.buttonPrimary)
            .controlSize(.large)
            .padding(.horizontal)
            
        }.padding()
    }
    
    private func shareQR() {
        guard let qrImage = qrImage else { return }
        let activityVC = UIActivityViewController(
            activityItems: [qrImage, item.content],
            applicationActivities: nil
        )
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityVC, animated: true)
        }
    }
}
