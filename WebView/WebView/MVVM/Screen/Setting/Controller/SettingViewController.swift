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
    
    var invicator = UIActivityIndicatorView()
    let dropDown = DropDown()
    let viewmodel = SettingViewModels()
    let phoneName = UIDevice.current.name
    let model = UIDevice.current.model
    let uID = UIDevice.current.identifierForVendor?.uuidString ?? ""
    
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
            HAUserDefault.saveDropdownLanguage(item: item.getLanguage())
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
        invicator.center = view.center
        invicator.style = UIActivityIndicatorView.Style.large
        invicator.color = .black
        view.addSubview(invicator)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        viewmodel.logout(eventHandle: EventHandle.logout.getEventHandle(), email: emailTxtField.text ?? "", language: dropDown.selectedItem ?? "", phoneName: phoneName, uID: uID, model: model)
        emailTxtField.text = ""
        passwordTxtField.text = ""
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        self.invicator.startAnimating()
        viewmodel.login(eventHandle: EventHandle.login.getEventHandle(), email: emailTxtField.text ?? "", password: passwordTxtField.text ?? "", language: dropDown.selectedItem ?? "", phoneName: phoneName, uID: uID, model: model, completion: { isSuccess, mess  in
            if isSuccess {
                self.invicator.stopAnimating()
                let alert = UIAlertController()
                alert.showAlert(title: "Success", message: mess, buttonAction: "Done", controller: self)
//                self.navigationController?.popViewController(animated: true)
            } else {
                self.invicator.stopAnimating()
                let alert = UIAlertController()
                alert.showAlert(title: "Warning", message: mess, buttonAction: "Done", controller: self)
//                self.navigationController?.popViewController(animated: true)
            }
        })
        
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        viewmodel.resetPassword(eventHandle: EventHandle.resetPassword.getEventHandle(), email: emailTxtField.text ?? "", phoneName: phoneName, uID: uID, model: model)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func languageDropdownButton(_ sender: Any) {
        dropDown.show()
    }
}
