//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mathilde FERRAND on 30/01/2019.
//  Copyright © 2019 Mathilde FERRAND. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.contentInset = UIEdgeInsets(top: 200.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier())
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier(), for: indexPath)
        return cell
    }
}

extension UITableViewCell {
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
}

