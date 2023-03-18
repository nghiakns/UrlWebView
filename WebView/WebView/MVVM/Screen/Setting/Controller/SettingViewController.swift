//
//  SettingViewController.swift
//  WebView
//
//  Created by Kim Nghĩa on 07/03/2023.
//

import UIKit
import DropDown

protocol AlertCallBack {
    func showAlert(message: String, isShow: Bool)
}

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
    @IBOutlet weak var settingTitle: UILabel!
    
    var invicator = UIActivityIndicatorView()
    let dropDown = DropDown()
    let viewmodel = SettingViewModels()
    let phoneName = UIDevice.current.name
    let model = UIDevice.current.model
    let uID = UIDevice.current.identifierForVendor?.uuidString ?? ""
    var delegate: AlertCallBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        cancelButton.setTitle(ResourceText.commonCancel.localizedString(), for: .normal)
        nextButton.setTitle(ResourceText.commonNext.localizedString(), for: .normal)
        settingTitle.text = ResourceText.settingTitle.localizedString()
        descriptionText.text = ResourceText.settingNotice.localizedString()
        passwordLabel.text = ResourceText.commonPassword.localizedString()
        languageLabel.text = ResourceText.settingLanguage.localizedString()
        resetPasswordButton.setTitle(ResourceText.settingResetpass.localizedString(), for: .normal)
        dropDown.anchorView = dropDownButton
        dropDown.dataSource = DropdownData.languageDropdown
        if WebViewUserDefault.getDropdownLanguage() == "en" {
            dropDown.selectRow(1)
            dropDownButton.setTitle(ResourceText.settingLanguageEnglish.localizedString(), for: .normal)
        } else {
            dropDown.selectRow(0)
            dropDownButton.setTitle(ResourceText.settingLanguageVietNam.localizedString(), for: .normal)
        }
        dropDownButton.layer.borderColor = UIColor.lightGray.cgColor
        dropDownButton.layer.borderWidth = 1
        dropDownButton.layer.cornerRadius = dropDownButton.frame.height / 2
        dropDownButton.layer.masksToBounds = true
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.dropDownButton.setTitle(item, for: .normal)
            WebViewUserDefault.saveDropdownLanguage(item: "en")
        }
        languageDropdownImage.setImageColor(color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1))
        headerView.backgroundColor = ResourceColor.headerView
        cancelButton.backgroundColor = ResourceColor.cancelButton
        nextButton.backgroundColor = ResourceColor.headerView
        cancelButton.tintColor = .white
        nextButton.tintColor = .white
        cancelButton.layer.cornerRadius = 5
        nextButton.layer.cornerRadius = 5
        cancelButton.setTitle(ResourceText.commonCancel.localizedString(), for: .normal)
        nextButton.setTitle(ResourceText.commonNext.localizedString(), for: .normal)
        invicator.center = view.center
        invicator.style = UIActivityIndicatorView.Style.large
        invicator.color = .black
        view.addSubview(invicator)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        var language = ""
        if dropDown.selectedItem == ResourceText.settingLanguageEnglish.localizedString() {
            language = "eng"
        } else {
            language = "vie"
        }
        viewmodel.logout(eventHandle: EventHandle.logout.getEventHandle(), email: emailTxtField.text ?? "", language: language, phoneName: phoneName, uID: uID, model: model)
        emailTxtField.text = ""
        passwordTxtField.text = ""
        WebViewUserDefault.saveIsLogin(isLogin: false)
        let alert = UIAlertController()
        alert.showAlert(title: ResourceText.commonAlert.localizedString(), message: ResourceText.settingAlertLogoutSuccess.localizedString(), buttonAction: ResourceText.commonClose.localizedString(), controller: self)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        self.invicator.startAnimating()
        var language = ""
        if dropDown.selectedItem == ResourceText.settingLanguageEnglish.localizedString() {
            WebViewUserDefault.saveDropdownLanguage(item: "en")
            language = "eng"
        } else {
            WebViewUserDefault.saveDropdownLanguage(item: "vi")
            language = "vie"
        }
        viewmodel.login(eventHandle: EventHandle.login.getEventHandle(), email: emailTxtField.text ?? "", password: passwordTxtField.text ?? "", language: language, phoneName: phoneName, uID: uID, model: model, completion: { isSuccess, mess  in
            if isSuccess {
                self.invicator.stopAnimating()
                WebViewUserDefault.saveIsLogin(isLogin: true)
                guard let delegate = self.delegate else { return }
                delegate.showAlert(message: mess, isShow: false)
                self.navigationController?.popViewController(animated: true)
            } else {
                self.invicator.stopAnimating()
                guard let delegate = self.delegate else { return }
                delegate.showAlert(message: mess, isShow: false)
                self.navigationController?.popViewController(animated: true)
            }
        })
        
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        viewmodel.resetPassword(eventHandle: EventHandle.resetPassword.getEventHandle(), email: emailTxtField.text ?? "", phoneName: phoneName, uID: uID, model: model)
        let alert = UIAlertController()
        alert.showAlert(title: ResourceText.commonAlert.localizedString(), message: ResourceText.settingAlertResetPassSuccess.localizedString(), buttonAction: ResourceText.commonClose.localizedString(), controller: self)
    }
    
    @IBAction func languageDropdownButton(_ sender: Any) {
        dropDown.show()
    }
}
