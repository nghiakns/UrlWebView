//
//  ViewController.swift
//  WebView
//
//  Created by Kim Nghĩa on 22/02/2023.
//

import UIKit
import WebKit
class HomeViewController: UIViewController, WKUIDelegate{

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var homeTitle: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var addImage: UIImageView!
    
    var taskSevices = ModelSevices()
    var tasks:[ModelsUrl] = []
    var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        config()
        configTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableview.delegate = self
        tableview.dataSource = self
        do{
            tasks = try taskSevices.getTask()
            tableview.reloadData()
        } catch let error{
            print(error.localizedDescription)
        }
    }
    
//    override func loadView() {
//          let webConfiguration = WKWebViewConfiguration()
//          webView = WKWebView(frame: .zero, configuration: webConfiguration)
//          webView.uiDelegate = self
//          view = webView
//       }
//
    override func viewDidDisappear(_ animated: Bool) {
        self.view.alpha = 1
    }
    func config() {
//        infoImage.backgroundColor = ResourceColor.headerView
//        addImage.backgroundColor = ResourceColor.headerView
//        infoImage.layer.cornerRadius = infoImage.frame.width / 2
//        infoImage.tintColor = ResourceColor.headerView
//        addImage.tintColor = ResourceColor.headerView
//        infoImage.setImageColor(color: ResourceColor.headerView)
//        addImage.setImageColor(color: ResourceColor.headerView)
        headerView.backgroundColor = ResourceColor.headerView
        homeTitle.text = "Home"
        homeTitle.textColor = .white
    }
    
    func configTableView() {
        tableview.register(UrlTableViewCell.nib, forCellReuseIdentifier: UrlTableViewCell.identifier)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
    }
    
    @IBAction func infoButton(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "alert") as? AlertViewController else { return }
        vc.modalPresentationStyle = .custom
        vc.view.backgroundColor = .clear
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func settingButton(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "setting") as? SettingViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func addButton(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UrlDetailViewController") as? UrlDetailViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UrlTableViewCell.identifier, for: indexPath) as? UrlTableViewCell else { return UITableViewCell() }
        cell.domainUrlUILabel.text = tasks[indexPath.row].domain
        let image = tasks[indexPath.row].icon ?? ""
        if let decodedData = Data(base64Encoded: image, options: .ignoreUnknownCharacters) {
            let image = UIImage(data: decodedData)
            cell.iconUrlImageView.image = image
        }
        return cell
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myURL = URL(string: tasks[indexPath.row].domain ?? "")
              let myRequest = URLRequest(url: myURL!)
              webView.load(myRequest)
    }
}

