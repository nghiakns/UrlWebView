//
//  SettingViewController.swift
//  WebView
//
//  Created by Kim Nghĩa on 07/03/2023.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var resetPassword: UIButton!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        emailLabel.text = "Email:"
        passwordLabel.text = "Pass word:"
        languageLabel.text = "Language:"
        resetPasswordButton.setTitle("Reset password", for: .normal)
        descriptionText.text = "Nếu bạn đã mua gói tài khoản nâng cao, xin hãy nhập thông tin bên dưới để kích hoạt các tính năng mở rộng"
        headerView.backgroundColor = ResourceColor.headerView
        cancelButton.backgroundColor = ResourceColor.cancelButton
        nextButton.backgroundColor = ResourceColor.headerView
        cancelButton.tintColor = .white
        nextButton.tintColor = .white
        cancelButton.layer.cornerRadius = 5
        nextButton.layer.cornerRadius = 5
        cancelButton.setTitle("Cancel", for: .normal)
        nextButton.setTitle("Next", for: .normal)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
