//
//  Constants.swift
//  WebView
//
//  Created by Kim Nghĩa on 08/03/2023.
//

import Foundation

struct DropdownData {
    
    static let inspectionTimes = [
        "http".localized,
        "https".localized,
        "rtsp".localized,
    ]
    
    static let homeDropDown = [
        "-".localized,
        "Touch".localized,
        "Scada-Vis".localized,
        "Schedulers".localized,
        "Mosaic".localized,
        "Assistant".localized,
        "Premium".localized,
    ]
    
    
    static func getInspectionTimeWithInterval(interval: Double) -> String {
        switch interval {
        case 1:
            return "http".localized
        case 2:
            return "https".localized
        case 3:
            return "rtsp".localized
        case 4:
            return "4seconds".localized
        default:
            return "http".localized
        }
    }
    
    static func getHomeDropDown(interval: Double) -> String {
        switch interval {
        case 1:
            return "-".localized
        case 2:
            return "Touch".localized
        case 3:
            return "Scada-Vis".localized
        case 4:
            return "Schedulers".localized
        case 5:
            return "Mosaic".localized
        case 6:
            return "Assistant".localized
        case 7:
            return "Premium".localized
        default:
            return "-".localized
        }
    }
    
}
