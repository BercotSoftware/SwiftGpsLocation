//
//  LocationQuality.swift
//  GPSViewer
//
//  Created by Douglas Bercot on 4/29/25.
//  Copyright © 2025 NunjoBiznezz. All rights reserved.
//

import CoreLocation
import SwiftUI

func accuracyDescription(for accuracy: CLLocationAccuracy) -> (text: String, color: Color) {
    switch accuracy {
    case ..<5:
        return ("Excellent", .green)
    case ..<20:
        return ("Good", .yellow)
    case ..<50:
        return ("Fair", .orange)
    default:
        return ("Poor", .red)
    }
}
