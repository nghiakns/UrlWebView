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
    
    func showAlertConfirm(message: String, controller: UIViewController, completion: @escaping (_ isConfirm: Bool) -> Void) {
        let alert = UIAlertController(title: ResourceText.commonAlert.localizedString(), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ResourceText.commonOk.localizedString(), style: .default, handler: { _ in
            completion(true)
        }))
        alert.addAction(UIAlertAction(title: ResourceText.commonCancel.localizedString(), style: .default, handler: { _ in
            completion(false)
        }))
        controller.present(alert, animated: true)
    }
}
