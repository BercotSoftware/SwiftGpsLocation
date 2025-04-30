//
//  ContentView.swift
//  GPSViewer
//
//  Created by Douglas Bercot on 4/29/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = LocationViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Your Location")
                .font(.title)

            if let error = viewModel.error {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            }

            Text("Latitude: \(viewModel.formattedLatitude)")
            Text("Longitude: \(viewModel.formattedLongitude)")

            accuracyView

            Picker("Format", selection: $viewModel.format) {
                ForEach(CoordinateFormat.allCases) { format in
                    Text(format.rawValue).tag(format)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
        .padding()
    }

    private var accuracyView: some View {
        let (label, color) = accuracyDescription(for: viewModel.accuracy)
        return HStack {
            Circle()
                .fill(color)
                .frame(width: 10, height: 10)
            Text("Accuracy: \(label) (\(String(format: "%.1f", viewModel.accuracy)) m)")
                .foregroundColor(color)
        }
    }
}

#Preview {
    ContentView()
}
