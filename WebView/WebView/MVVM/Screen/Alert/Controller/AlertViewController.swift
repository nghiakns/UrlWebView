//
//  AlertViewController.swift
//  WebView
//
//  Created by Kim Nghĩa on 07/03/2023.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var contactLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        alertView.layer.cornerRadius = 5
        closeButton.backgroundColor = ResourceColor.headerView
        closeButton.setTitle(ResourceText.commonClose.localizedString(), for: .normal)
        alertTitle.text = ResourceText.commonInfo.localizedString()
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.layer.cornerRadius = 5
        alertView.layer.borderWidth = 2
        let att = NSMutableAttributedString()
        contactLabel.attributedText = att.bold("Hotline:")
        contactLabel.attributedText = att.normal(" 0977 345 151")
        contactLabel.attributedText = att.bold("\nWebsite:")
        contactLabel.attributedText = att.normal(" https://gammatech.com.vn/")
        contactLabel.attributedText = att.bold("\nEmail:")
        contactLabel.attributedText = att.normal(" lienhe@gammavietnam.com.vn")
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension NSMutableAttributedString {
    var fontSize:CGFloat { return 17 }
    var boldFont:UIFont { return UIFont(name: "Arial Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont:UIFont { return UIFont(name: "Arial", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}
    
    func bold(_ value:String) -> NSMutableAttributedString {
        
        let boldAttributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:boldAttributes))
        return self
    }
    
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let normalAttributes:[NSAttributedString.Key : Any] = [
            .font : normalFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:normalAttributes))
        return self
    }
}
