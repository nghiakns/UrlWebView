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
    @IBOutlet weak var loginWithLabel: UILabel!
    @IBOutlet weak var loginWithButton: UIButton!
    @IBOutlet weak var loginWithImage: UIImageView!
    
    var invicator = UIActivityIndicatorView()
    let dropDown = DropDown()
    let loginWithDropDown = DropDown()
    let viewmodel = SettingViewModels()
    let phoneName = UIDevice.current.name
    let model = UIDevice.current.model
    let uID = UIDevice.current.identifierForVendor?.uuidString ?? ""
    var delegate: AlertCallBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        configLoginWith()
    }
    
    func config() {
        cancelButton.setTitle(ResourceText.commonCancel.localizedString(), for: .normal)
        nextButton.setTitle(ResourceText.commonNext.localizedString(), for: .normal)
        settingTitle.text = ResourceText.settingTitle.localizedString()
        descriptionText.text = ResourceText.settingNotice.localizedString()
        passwordLabel.text = ResourceText.commonKey.localizedString()
        languageLabel.text = ResourceText.settingLanguage.localizedString()
        loginWithLabel.text = ResourceText.commonLogin.localizedString()
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
//            WebViewUserDefault.saveDropdownLanguage(item: "en")
        }
        languageDropdownImage.setImageColor(color: UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1))
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
    
    func configLoginWith() {
        loginWithDropDown.anchorView = loginWithButton
        loginWithDropDown.dataSource = DropdownData.typeOfLoginDropdown
        loginWithButton.setTitle(ResourceText.settingKey.localizedString(), for: .normal)
        loginWithDropDown.selectRow(0)
        loginWithDropDown.selectionAction = {  [weak self] (index: Int, item: String) in
            self?.loginWithButton.setTitle(item, for: .normal)
            if index == 0 {
                self?.emailLabel.text = ResourceText.commonDeviceAddr.localizedString()
                self?.passwordLabel.text = ResourceText.commonKey.localizedString()
            } else {
                self?.emailLabel.text = ResourceText.commonEmail.localizedString()
                self?.passwordLabel.text = ResourceText.commonPassword.localizedString()
            }
        }
        loginWithButton.layer.borderColor = UIColor.lightGray.cgColor
        loginWithButton.layer.borderWidth = 1
        loginWithButton.layer.cornerRadius = loginWithButton.frame.height / 2
        loginWithButton.layer.masksToBounds = true
        loginWithImage.setImageColor(color: UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1))
    }
    
    func loginWithEmail(language: String) {
        viewmodel.loginWithEmail(eventHandle: EventHandle.login.getEventHandle(), email: emailTxtField.text ?? "", password: passwordTxtField.text ?? "", language: language, phoneName: phoneName, uID: uID, model: model, completion: { [weak self] isSuccess, mess  in
            if isSuccess {
                self?.invicator.stopAnimating()
                WebViewUserDefault.saveIsLogin(isLogin: true)
                guard let delegate = self?.delegate else { return }
                delegate.showAlert(message: mess, isShow: false)
                self?.navigationController?.popViewController(animated: true)
            } else {
                self?.invicator.stopAnimating()
                guard let delegate = self?.delegate else { return }
                delegate.showAlert(message: mess, isShow: false)
                self?.navigationController?.popViewController(animated: true)
            }
        })
    }
    
    func loginWithDeviceAdd(language: String) {
        viewmodel.loginWithDeviceAdd(deviceAdd: emailTxtField.text ?? "", key: passwordTxtField.text ?? "", lang: language, phoneName: phoneName, uID: uID, model: model) { [weak self] isSuccess, mess in
            if isSuccess {
                self?.invicator.stopAnimating()
                WebViewUserDefault.saveIsLogin(isLogin: true)
                WebViewUserDefault.setKey(key: self?.passwordTxtField.text ?? "")
                guard let delegate = self?.delegate else { return }
                delegate.showAlert(message: mess, isShow: false)
                self?.navigationController?.popViewController(animated: true)
            } else {
                self?.invicator.stopAnimating()
                guard let delegate = self?.delegate else { return }
                delegate.showAlert(message: mess, isShow: false)
                self?.navigationController?.popViewController(animated: true)
            }
        }
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
        WebViewUserDefault.setKey(key: "")
        let alert = UIAlertController()
        alert.showAlert(title: ResourceText.commonAlert.localizedString(), message: ResourceText.settingAlertLogoutSuccess.localizedString(), buttonAction: ResourceText.commonClose.localizedString(), controller: self)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        self.invicator.startAnimating()
        var language = ""
        if dropDown.indexForSelectedRow == 1 {
            WebViewUserDefault.saveDropdownLanguage(item: "en")
            language = "eng"
        } else {
            WebViewUserDefault.saveDropdownLanguage(item: "vi")
            language = "vie"
        }
        if loginWithDropDown.indexForSelectedRow == 0 {
            loginWithDeviceAdd(language: language)
        } else {
            loginWithEmail(language: language)
        }
        
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        viewmodel.resetPassword(eventHandle: EventHandle.resetPassword.getEventHandle(), email: emailTxtField.text ?? "", phoneName: phoneName, uID: uID, model: model)
        let alert = UIAlertController()
        alert.showAlert(title: ResourceText.commonAlert.localizedString(), message: ResourceText.settingAlertResetPassSuccess.localizedString(), buttonAction: ResourceText.commonClose.localizedString(), controller: self)
    }
    
    @IBAction func typeOfLoginButton(_ sender: Any) {
        loginWithDropDown.show()
    }
    
    
    @IBAction func languageDropdownButton(_ sender: Any) {
        dropDown.show()
    }
    
}
