//
//  HistoryQRCell.swift
//  ReelRover
//
//  Created by Maxim Golovlev on 20.08.2025.
//

import SwiftUI

struct HistoryQRCell: View {
    let item: QRItem
    let qrImage: UIImage?
    
    var body: some View {
        VStack(spacing: 12) {
            if let qrImage = qrImage {
                Image(uiImage: qrImage)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                   // .frame(width: 120, height: 120)
                    .background(Color.app.whiteBackground)
                    .cornerRadius(12)
                    .appShadow()
            }
            
            VStack(spacing: 4) {
                Text(item.content.prefix(20) + (item.content.count > 20 ? "..." : ""))
                    .font(.system(size: 13, weight: .medium))
                    .lineLimit(1)
                    .foregroundColor(.app.primaryText)
                
                Text(item.date.formatted(date: .numeric, time: .shortened))
                    .font(.system(size: 11))
                    .foregroundColor(.app.secondaryText)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(16)
        .background(
            Color.app.cardBackground
                .opacity(0.9)
                .cornerRadius(16)
        )
        .shadow(color: .app.shadowLight, radius: 3, x: 0, y: 1)
    }
}
