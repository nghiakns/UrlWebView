//
//  UrlModels.swift
//  WebView
//
//  Created by Kim Nghĩa on 09/03/2023.
//

import Foundation
import UIKit

class ModelsUrl: Codable {
    
    var domain: String?
    var protocols: String?
    var name: String?
    var user: String?
    var password: String?
    var autoLoad: Bool?
    var icon: String?
    var autoLoadPage: String?
    var params: String?
    var url: String?
    
    init(domain: String?, protocols: String?, name: String?, user: String?, password: String?,icon: String, autoLoad: Bool, autoLoadPage: String?, params: String?, url: String?) {
        self.domain = domain
        self.protocols = protocols
        self.name = name
        self.user = user
        self.password = password
        self.autoLoad = autoLoad
        self.icon = icon
        self.autoLoadPage = autoLoadPage
        self.params = params
        self.url = url
    }
}
