//
//  ViewController.swift
//  WebView
//
//  Created by Kim Nghĩa on 22/02/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var homeTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        config()
        configTableView()
    }
    
    func config() {
        //
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
        
    }
    
    @IBAction func settingButton(_ sender: Any) {
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UrlTableViewCell.identifier, for: indexPath) as? UrlTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

