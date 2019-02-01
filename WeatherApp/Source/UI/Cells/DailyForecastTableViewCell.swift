//
//  DailyForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Mathilde FERRAND on 01/02/2019.
//  Copyright © 2019 Mathilde FERRAND. All rights reserved.
//

import UIKit
import SnapKit

class DailyForecastTableViewCell: UITableViewCell {
    
    var views = [DayForecastView]()
    var forecastItems = [DailyForecastItem]()
    let dateFormatter = DateFormatter()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        dateFormatter.dateFormat = "EEEE"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupForecastItems() {
        forecastItems.append(DailyForecastItem(day: displayName(for: Date().date(after: forecastItems.count + 1)), weatherType: .snow))
        forecastItems.append(DailyForecastItem(day: displayName(for: Date().date(after: forecastItems.count + 1)), weatherType: .sunny))
        forecastItems.append(DailyForecastItem(day: displayName(for: Date().date(after: forecastItems.count + 1)), weatherType: .rain))
        forecastItems.append(DailyForecastItem(day: displayName(for: Date().date(after: forecastItems.count + 1)), weatherType: .snow))
        forecastItems.append(DailyForecastItem(day: displayName(for: Date().date(after: forecastItems.count + 1)), weatherType: .cloudy))
        forecastItems.append(DailyForecastItem(day: displayName(for: Date().date(after: forecastItems.count + 1)), weatherType: .snow))
        forecastItems.append(DailyForecastItem(day: displayName(for: Date().date(after: forecastItems.count + 1)), weatherType: .sunny))
        forecastItems.append(DailyForecastItem(day: displayName(for: Date().date(after: forecastItems.count + 1)), weatherType: .rain))
        forecastItems.append(DailyForecastItem(day: displayName(for: Date().date(after: forecastItems.count + 1)), weatherType: .sunny))
    }
    
    func setupViews() {
        setupForecastItems()
        
        for (_, item) in forecastItems.enumerated() {
            let dayView = DayForecastView(frame: .zero)
            dayView.update(with: item)
            contentView.addSubview(dayView)
            views.append(dayView)
        }
    }
    
    func initializeConstraints() {
        
        for (index, view) in views.enumerated() {
            
            view.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                
                if index == 0 {
                    make.top.equalToSuperview()
                } else {
                    let previousView = views[index - 1]
                    make.top.equalTo(previousView.snp.bottom)
                }
                
                if index == views.count - 1 {
                    make.bottom.equalToSuperview().priority(.low)
                }
            }
        }
    }
    
    func displayName(for date: Date) -> String {
        return dateFormatter.string(from: date)
    }

}

extension Date {
    func date(after days: Int) -> Date {
        let secondsInADay: TimeInterval = 24 * 60 * 60
        return self.addingTimeInterval(Double(days) * secondsInADay)
    }
}
