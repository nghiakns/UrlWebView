//
//  ViewController.swift
//  WebView
//
//  Created by Kim Nghĩa on 18/03/2023.
//

import UIKit
import WebKit

class WebviewViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    var urlString:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: urlString) else { return }
        webview.load(URLRequest(url: url))
    }
    
    @IBAction func doneButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
