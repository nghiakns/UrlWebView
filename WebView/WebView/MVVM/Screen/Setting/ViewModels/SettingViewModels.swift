//
//  SettingViewModels.swift
//  WebView
//
//  Created by Kim Nghĩa on 08/03/2023.
//

import Foundation
import Alamofire

class SettingViewModels {
    func login(cm: String, email: String, password: String, language: String, phoneName: String, model: String, uID: String, language: String) {
        let url = BaseApiRespositories.url
        let params = ["cm": cm,
                      "email": email,
                      "language": language,
        ]
    }
}
