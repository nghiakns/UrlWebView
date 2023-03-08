//
//  HAUserDefault.swift
//  WebView
//
//  Created by Macbook Pro on 07/03/2023.
//

import Foundation
import UIKit

class HAUserDefault {
    static let userDefault = UserDefaults.standard
    static let kIntervalTime = "CountDownIntervalTime"
    static func saveSettingWith(key: String, value: Int) {
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    static func saveCountDownIntervalTime(intervalTime: Double) {
        userDefault.set(intervalTime, forKey: kIntervalTime)
    }
    
   
}
