//
//  SettingViewModels.swift
//  WebView
//
//  Created by Kim Nghĩa on 08/03/2023.
//

import Foundation
import Alamofire

class SettingViewModels {
    var res: String? = nil
    func login(email: String, password: String, language: String, phoneName: String, uID: String, model: String) {
        let url = BaseApiRespositories.url
        if !email.isEmpty || !password.isEmpty {
            let params = ["cm": "glogin",
                          "email": email,
                          "password": password,
                          "language": language,
                          "phonename": phoneName,
                          "uID": uID,
                          "model": model
            ]
            AF.request(url, method: .get, parameters: params).responseData { res in
                if let data = res.data {
                    let json = String(data: data, encoding: String.Encoding.utf8)
                    print(json)
                }
            }
        }
    }
}
