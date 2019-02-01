//
//  WeatherPropertiesTableViewCell.swift
//  WeatherApp
//
//  Created by Mathilde FERRAND on 01/02/2019.
//  Copyright © 2019 Mathilde FERRAND. All rights reserved.
//

import UIKit
import SnapKit

class WeatherPropertiesTableViewCell: UITableViewCell {
    
    let leftView = WeatherPropertyView(frame: .zero)
    let rightView = WeatherPropertyView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func updateWith(rowItem: WeatherPropertyDataItem) {
        leftView.subtitle.text = rowItem.primaryTitle
        leftView.property.text = rowItem.primaryValue
        rightView.subtitle.text = rowItem.secondaryTitle
        rightView.property.text = rowItem.secondaryValue
    }
    
    func setupViews() {
        contentView.addSubview(leftView)
        contentView.addSubview(rightView)
        
        initializeConstraints()
    }
    
    func initializeConstraints() {
        
        leftView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        rightView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }

    }

}
