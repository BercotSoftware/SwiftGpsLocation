//
//  CoordinateFormat.swift
//  GPSViewer
//
//  Created by Douglas Bercot on 4/29/25.
//  Copyright © 2025 NunjoBiznezz. All rights reserved.
//

enum CoordinateFormat: String, CaseIterable, Identifiable {
    case decimalDegrees = "Decimal Degrees"
    case degreesMinutes = "Degrees + Decimal Minutes"
    case degreesMinutesSeconds = "Degrees + Minutes + Seconds"

    var id: String { self.rawValue }
}

