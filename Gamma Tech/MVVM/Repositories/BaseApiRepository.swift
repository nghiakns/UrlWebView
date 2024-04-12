//
//  BaseApiRepository.swift
//  WebView
//
//  Created by Kim Nghĩa on 08/03/2023.
//

import Foundation

struct BaseApiRespositories {
    static let url = "https://raigamma.000webhostapp.com/rai.php"
}

enum EventHandle {
    case login
    // Login
    case logout
    // Logout
    case resetPassword
    // Reset Password
    func getEventHandle() -> String {
        switch self {
        case .login:
            return "glogin"
        case .logout:
            return "glogout"
        case .resetPassword:
            return "resetpassword"
        }
    }
}

