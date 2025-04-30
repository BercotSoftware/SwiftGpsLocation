//
//  GPSCoordinates.swift
//  GPSViewer
//
//  Created by Douglas Bercot on 4/29/25.
//  Copyright © 2025 NunjoBiznezz. All rights reserved.
//
import Foundation

struct CoordinateFormatter {
    static func format(_ value: Double, format: CoordinateFormat) -> String {
        let absValue = abs(value)
        let degrees = Int(absValue)
        let minutesDecimal = (absValue - Double(degrees)) * 60

        switch format {
        case .decimalDegrees:
            return String(format: "%.6f", value)

        case .degreesMinutes:
            let sign = value < 0 ? "-" : ""
            return String(format: "%@%d° %.3f'", sign, degrees, minutesDecimal)

        case .degreesMinutesSeconds:
            let minutes = Int(minutesDecimal)
            let seconds = (minutesDecimal - Double(minutes)) * 60
            let sign = value < 0 ? "-" : ""
            return String(format: "%@%d° %d' %.2f\"", sign, degrees, minutes, seconds)
        }
    }
}
