//
//  WeatherRowItem.swift
//  WeatherApp
//
//  Created by Mathilde FERRAND on 01/02/2019.
//  Copyright © 2019 Mathilde FERRAND. All rights reserved.
//

import Foundation

protocol WeatherPropertyDataItem {
    var primaryTitle: String { get }
    var secondaryTitle: String { get }
    var primaryValue: String { get }
    var secondaryValue: String { get }
}

struct WeatherPropertyRowItem: WeatherRowItem, WeatherPropertyDataItem {
    var type: WeatherInfoType
    let primaryTitle: String
    let secondaryTitle: String
    let primaryValue: String
    let secondaryValue: String
    
    init(type: WeatherInfoType, primaryTitle: String, secondaryTitle: String, primaryValue: String, secondaryValue: String) {
        self.type = type
        self.primaryTitle = primaryTitle
        self.secondaryTitle = secondaryTitle
        self.primaryValue = primaryValue
        self.secondaryValue = secondaryValue
    }
}
