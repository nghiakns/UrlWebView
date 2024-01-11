//
//  ViewController.swift
//  WebView
//
//  Created by Kim Nghĩa on 18/03/2023.
//

import UIKit
import WebKit

class WebviewViewController: UIViewController, WKNavigationDelegate{

    @IBOutlet weak var webview: WKWebView!
    
    var urlString: String = ""
    var userName: String = ""
    var passWord: String = ""
    var invicator = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard let url = URL(string: urlString) else { return }
        self.webview.load(URLRequest(url: url))
        invicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.invicator.stopAnimating()
        }
    }
    
    func config() {
        webview.navigationDelegate = self
        invicator.center = view.center
        invicator.style = UIActivityIndicatorView.Style.large
        invicator.color = .black
        view.addSubview(invicator)
    }
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let username = userName
        let password = passWord
        let credential = URLCredential(user: username, password: password, persistence: .forSession)
        completionHandler(.useCredential, credential)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.invicator.stopAnimating()
    }
    
    @IBAction func doneButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
