//
//  HomeViewModels.swift
//  WebView
//
//  Created by Kim Nghĩa on 15/03/2023.
//

import Foundation
import Alamofire

class HomeViewModels {
    func checkLoadView(url: String, completion: @escaping (_ canLoaded: Bool) -> Void) {
        AF.request(url, method: .get).responseData { res in
            if res.data != nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
