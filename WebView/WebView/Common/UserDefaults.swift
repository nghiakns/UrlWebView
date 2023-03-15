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
    static let kProtocols = "protocols"
    static let kLanguage = "language"
    static let kHome = "home"
    static func saveSettingWith(key: String, value: Int) {
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    static func saveDropdownProtocols(item: Double) {
        userDefault.set(item, forKey: kProtocols)
    }
    
    static func saveDropdownHome(item: Double) {
        userDefault.set(item, forKey: kHome)
    }
    
    static func saveDropdownLanguage(item: Double) {
        userDefault.set(item, forKey: kLanguage)
    }
    
    static func getDropdownLanguage(item: Double) -> String {
        return userDefault.string(forKey: kLanguage) ?? ""
    }
}
