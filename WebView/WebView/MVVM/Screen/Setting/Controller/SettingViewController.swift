//
//  SettingViewController.swift
//  WebView
//
//  Created by Kim Nghĩa on 07/03/2023.
//

import UIKit
import DropDown

class SettingViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var languageDropdownView: UIView!
    @IBOutlet weak var languageDropdownImage: UIImageView!
    @IBOutlet weak var dropDownButton: UIButton!
    let dropDown = DropDown()
    
    let viewmodel = SettingViewModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        dropDown.anchorView = dropDownButton
        dropDown.dataSource = DropdownData.languageDropdown
        dropDownButton.layer.borderColor = UIColor.lightGray.cgColor
        dropDownButton.layer.borderWidth = 1
        dropDownButton.layer.cornerRadius = dropDownButton.frame.height / 2
        dropDownButton.layer.masksToBounds = true
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.dropDownButton.setTitle(item, for: .normal)
            HAUserDefault.saveCountDownIntervalTime(intervalTime: item.getLanguage())
        }

        languageDropdownImage.setImageColor(color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1))
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
        let phoneName = UIDevice.current.name
        let model = UIDevice.current.model
        let uID = UIDevice.current.identifierForVendor?.uuidString ?? ""
        viewmodel.login(email: emailTxtField.text ?? "", password: passwordTxtField.text ?? "", language: "vie", phoneName: phoneName, uID: uID, model: model)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func languageDropdownButton(_ sender: Any) {
        dropDown.show()
    }
}
