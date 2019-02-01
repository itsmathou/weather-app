//
//  DayForecastView.swift
//  WeatherApp
//
//  Created by Mathilde FERRAND on 01/02/2019.
//  Copyright © 2019 Mathilde FERRAND. All rights reserved.
//

import UIKit
import SnapKit

class DayForecastView: UIView {
    let dayLabel = UILabel()
    let iconImageView = UIImageView()
    let temperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func update(with item: DailyForecastItem) {
        dayLabel.text = item.day
        var color: UIColor
        
        switch item.weatherType {
        case .sunny:
            color = .yellow
        case .cloudy:
            color = .gray
        case .rain:
            color = .lightGray
        case .snow:
            color = .white
        }
        iconImageView.backgroundColor = color
    }
    
    func setupViews() {
        self.addSubview(dayLabel)
        self.addSubview(iconImageView)
        self.addSubview(temperatureLabel)
        
        iconImageView.layer.borderColor = UIColor.black.cgColor
        iconImageView.layer.borderWidth = 0.25
        
        temperatureLabel.textAlignment = .right
        
        temperatureLabel.text = "29"
        
        initializeConstraints()
    }
    
    func initializeConstraints() {
        let defaultVerticalOffset: CGFloat = 2.5
        let defaultHorizontalOffset: CGFloat = 20.0
        
        dayLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(defaultHorizontalOffset)
            make.top.equalToSuperview().offset(defaultVerticalOffset)
            make.bottom.equalToSuperview().offset(-defaultVerticalOffset)
            make.height.equalTo(32.0)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(defaultVerticalOffset)
            make.bottom.equalToSuperview().offset(-defaultVerticalOffset)
            make.leading.equalTo(dayLabel.snp.trailing).offset(defaultHorizontalOffset)
            make.width.equalTo(iconImageView.snp.height)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-defaultVerticalOffset)
            make.top.equalToSuperview().offset(defaultVerticalOffset)
            make.bottom.equalToSuperview().offset(-defaultVerticalOffset)
        }
        
        temperatureLabel.sizeToFit()
    }

}

enum DailyForecastWeatherType {
    case sunny
    case cloudy
    case rain
    case snow
}

struct DailyForecastItem {
    let day: String
    let weatherType: DailyForecastWeatherType
    
    init(day: String, weatherType: DailyForecastWeatherType) {
        self.day = day
        self.weatherType = weatherType
    }
}
