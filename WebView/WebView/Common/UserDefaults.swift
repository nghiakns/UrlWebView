//
//  UserDefaults.swift
//  WebView
//
//  Created by Kim Nghĩa on 08/03/2023.
//


import Foundation
import UIKit

class WebViewUserDefault {
    static let userDefault = UserDefaults.standard
    static let kProtocols = "protocols"
    static let kLanguage = "language"
    static let kHome = "home"
    static let kIsLogin = "isLogin"
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
    
    static func saveDropdownLanguage(item: String) {
        userDefault.set(item, forKey: kLanguage)
    }
    
    static func getDropdownLanguage() -> String {
        return userDefault.string(forKey: kLanguage) ?? ""
    }
    
    static func saveIsLogin(isLogin: Bool) {
        userDefault.set(isLogin, forKey: kIsLogin)
    }
    
    static func getIsLogin() -> Bool {
        return userDefault.bool(forKey: kIsLogin)
    }
}
