//
//  WeatherTableViewRowItem.swift
//  WeatherApp
//
//  Created by Mathilde FERRAND on 01/02/2019.
//  Copyright © 2019 Mathilde FERRAND. All rights reserved.
//

import Foundation

enum WeatherInfoType: String {
    case dailyForecast
    case description
    case sunrise
    case rain
    case wind
    case precipitation
    case visibility
    
    var title: String {
        switch self {
        case .dailyForecast:
            return "Daily Forecast"
        case .description:
            return "Some description"
        case .sunrise:
            return "Sunrise"
        case .rain:
            return "Rain"
        case .wind:
            return "Wind"
        case .precipitation:
            return "Precipitation"
        case .visibility:
            return "Visibility"
        }
    }
}

protocol WeatherRowItem {
    var type: WeatherInfoType { get set }
}


