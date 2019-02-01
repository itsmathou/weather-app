//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mathilde FERRAND on 30/01/2019.
//  Copyright © 2019 Mathilde FERRAND. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    
    var rowItems = [WeatherRowItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupRows() {
        rowItems.append(DailyForecastRowItem())
        rowItems.append(WeatherDescriptionRowItem())
        rowItems.append(WeatherPropertyRowItem(type: .sunrise, primaryTitle: "sunrise", secondaryTitle: "sunset", primaryValue: "07:40", secondaryValue: "16:42"))
        rowItems.append(WeatherPropertyRowItem(type: .rain, primaryTitle: "chance of rain", secondaryTitle: "humidity", primaryValue: "20%", secondaryValue: "63%"))
        rowItems.append(WeatherPropertyRowItem(type: .wind, primaryTitle: "wind", secondaryTitle: "feels like", primaryValue: "6 mph", secondaryValue: "4C"))
        rowItems.append(WeatherPropertyRowItem(type: .precipitation, primaryTitle: "precipitation", secondaryTitle: "pressure", primaryValue: "0 mm", secondaryValue: "998 hPa"))
        rowItems.append(WeatherPropertyRowItem(type: .visibility, primaryTitle: "visibility", secondaryTitle: "uv index", primaryValue: "14.5 km", secondaryValue: "1"))
    }
    
    func setupTableView() {
        tableView.contentInset = UIEdgeInsets(top: 200.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        setupRows()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier())
        tableView.register(DailyForecastTableViewCell.self, forCellReuseIdentifier: DailyForecastTableViewCell.reuseIdentifier())
        tableView.register(WeatherPropertiesTableViewCell.self, forCellReuseIdentifier: WeatherPropertiesTableViewCell.reuseIdentifier())
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = rowItems[indexPath.row]
        
        switch item.type {
        case .dailyForecast:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.reuseIdentifier(), for: indexPath) as? DailyForecastTableViewCell else { return UITableViewCell() }
            return cell
            
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier(), for: indexPath)
            cell.textLabel?.text = item.type.title
            return cell
            
        case .sunrise, .rain, .precipitation, .visibility, .wind:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherPropertiesTableViewCell.reuseIdentifier(), for: indexPath) as? WeatherPropertiesTableViewCell else { return UITableViewCell() }
            if let propertyItem = item as? WeatherPropertyDataItem {
                cell.updateWith(rowItem: propertyItem)
            }
            return cell
        }
    }
}

extension UITableViewCell {
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
}

