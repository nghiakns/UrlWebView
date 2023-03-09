//
//  UrlDetailViewController.swift
//  WebView
//
//  Created by Kim Nghĩa on 08/03/2023.
//


import UIKit
import DropDown

class UrlDetailViewController: UIViewController, didSeclectImage {

    @IBOutlet weak var imageDropDownI: UIImageView!
    @IBOutlet weak var dropDownDomainButton: UIButton!
    @IBOutlet weak var IPView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var paramTextfield: UITextField!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var accTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var dropDownHomeButton: UIButton!
    @IBOutlet weak var imageHome: UIImageView!
    @IBOutlet weak var domainView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    let DropdownDomain = DropDown()
    let DropdownHome = DropDown()
//    let deldegate = AlertIconViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
//        deldegate.delegate = self
        imageDropDownI.setImageColor(color: UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1))
        imageHome.setImageColor(color: UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1))
        // Do any additional setup after loading the view.
    }
    
    func didSeclectImage(image: UIImage) {
        self.iconImage.image = image
    }
    
    private func configure() {
        DropdownDomain.anchorView = dropDownDomainButton
        DropdownDomain.dataSource = DropdownData.inspectionTimes
        DropdownHome.anchorView = dropDownHomeButton
        DropdownHome.dataSource = DropdownData.homeDropDown
        dropDownDomainButton.layer.borderColor = UIColor.lightGray.cgColor
        dropDownDomainButton.layer.borderWidth = 1
        dropDownDomainButton.layer.cornerRadius = 4
        dropDownDomainButton.layer.masksToBounds = true
        IPView.layer.borderWidth = 1
        IPView.layer.cornerRadius = 25
        IPView.layer.masksToBounds = true
        homeView.layer.borderWidth = 1
        homeView.layer.cornerRadius = 25
        homeView.layer.masksToBounds = true
        addButton.layer.borderWidth = 1
        addButton.layer.cornerRadius = 25
        addButton.layer.masksToBounds = true
        domainView.layer.borderWidth = 1
        domainView.layer.cornerRadius = 25
        domainView.layer.masksToBounds = true
        coradius(textfield: nameTextfield)
        coradius(textfield: paramTextfield)
        coradius(textfield: passTextField)
        coradius(textfield: accTextfield)
        //nguyen
        dropDownDomainButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        DropdownDomain.selectionAction = { [weak self] (index: Int, item: String) in
            self?.dropDownDomainButton.setTitle(item, for: .normal)
            HAUserDefault.saveCountDownIntervalTime(intervalTime: item.getDomain())
        }
        DropdownHome.selectionAction = { [weak self] (index: Int, item: String) in
            self?.dropDownHomeButton.setTitle(item, for: .normal)
            HAUserDefault.saveCountDownIntervalTime(intervalTime: item.getHome())
        }
    }
    

    func coradius(textfield: UITextField) {
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 25
        textfield.layer.masksToBounds = true
    }
    @IBAction func PodViewHomeTapButton(_ sender: Any) {
        let UIStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let VC = UIStoryBoard.instantiateViewController(withIdentifier: "UrlDetailViewController") as? UrlDetailViewController else { return }
        VC.modalPresentationStyle = .fullScreen
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dropDownHome(_ sender: Any) {
        DropdownHome.show()
    }
    @IBAction func dropDownDomainTapButton(_ sender: Any) {
        DropdownDomain.show()
    }
    
    @IBAction func AlertTapButton(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertIconViewController") as? AlertIconViewController else { return }
        vc.delegate = self
                self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
