//
//  Alert.swift
//  WebView
//
//  Created by Kim Nghĩa on 15/03/2023.
//

import Foundation
import UIKit

extension UIAlertController {
    func showAlert(title: String, message: String, buttonAction: String, controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonAction, style: .default))
        controller.present(alert, animated: true)
    }
}
