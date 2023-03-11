//
//  UserDefaults.swift
//  WebView
//
//  Created by Kim Nghĩa on 08/03/2023.
//


import Foundation
import UIKit

class HAUserDefault {
    static let userDefault = UserDefaults.standard
    static let kIntervalTime = "CountDownIntervalTime"
    static let kAutoLoad = "AutoLoad"
    static func saveSettingWith(key: String, value: Int) {
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    static func saveCountDownIntervalTime(intervalTime: Double) {
        userDefault.set(intervalTime, forKey: kIntervalTime)
    }
    
    static func getSettingWith(key: String) -> Bool {
        let mode = userDefault.integer(forKey: key)
        switch key {
        case kAutoLoad:
            return mode == 0 ? false : mode == 2
        default:
            return mode == 0 ? true : mode == 2
        }
    }
}
