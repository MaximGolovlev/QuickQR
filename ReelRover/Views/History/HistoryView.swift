//
//  HistoryView.swift
//  ReelRover
//
//  Created by Maxim Golovlev on 20.08.2025.
//


import SwiftUI
import CoreImage.CIFilterBuiltins

struct HistoryView: View {
    @EnvironmentObject private var historyModel: HistoryViewModel
    @State private var navigationPath = NavigationPath()
    @State private var searchText = ""
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    private let context = CIContext()
    private let filter = CIFilter.qrCodeGenerator()
    
    private var filteredItems: [QRItem] {
        if searchText.isEmpty {
            return historyModel.historyItems
        } else {
            return historyModel.historyItems.filter { item in
                item.content.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                
                BGGradient()
                
                Group {
                    if historyModel.historyItems.isEmpty {
                        emptyStateView
                    } else if filteredItems.isEmpty {
                        noResultsView
                    } else {
                        qrCollectionView
                    }
                }
                .navigationTitle("History")
                .navigationDestination(for: QRItem.self) { item in
                    QRDetailView(item: item, qrImage: generateQR(from: item.content))
                }
                .searchable(text: $searchText, prompt: "Search QR codes")
                .autocorrectionDisabled(true)
            }
        }
    }
    
    private var emptyStateView: some View {
        ContentUnavailableView(
            "No History",
            systemImage: "clock.badge.xmark",
            description: Text("Generated QR codes will appear here")
        )
    }
    
    private var noResultsView: some View {
        ContentUnavailableView.search
    }
    
    private var qrCollectionView: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(historyModel.historyItems) { item in
                    HistoryQRCell(item: item, qrImage: generateQR(from: item.content))
                        .onTapGesture {
                            navigationPath.append(item)
                        }
                        .contextMenu {
                            Button(role: .destructive) {
                                deleteItem(item)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            
                            Button {
                                shareItem(item)
                            } label: {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }
                        }
                }
            }
            .padding()
        }
    }
    
    private func generateQR(from string: String) -> UIImage? {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        return nil
    }
    
    private func deleteItem(_ item: QRItem) {
        if let index = historyModel.historyItems.firstIndex(where: { $0.id == item.id }) {
            historyModel.deleteItem(at: IndexSet(integer: index))
        }
    }
    
    private func shareItem(_ item: QRItem) {
        guard let qrImage = generateQR(from: item.content) else { return }
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
