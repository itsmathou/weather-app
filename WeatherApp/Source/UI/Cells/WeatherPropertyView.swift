//
//  WeatherPropertyView.swift
//  WeatherApp
//
//  Created by Mathilde FERRAND on 01/02/2019.
//  Copyright © 2019 Mathilde FERRAND. All rights reserved.
//

import UIKit
import SnapKit

class WeatherPropertyView: UIView {
    
    let subtitle = UILabel()
    let property = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews() {
        self.addSubview(subtitle)
        self.addSubview(property)
        
        initializeConstraints()
    }
    
    func initializeConstraints() {
        let defaultVerticalOffset: CGFloat = 2.5
        let defaultHorizontalOffset: CGFloat = 17.0
        
        subtitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(defaultHorizontalOffset)
            make.trailing.equalToSuperview().offset(-defaultHorizontalOffset)
            make.top.equalToSuperview().offset(defaultVerticalOffset)
            make.bottom.equalTo(property.snp.top).offset(-defaultVerticalOffset)
            make.height.equalTo(25)
        }
        
        property.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(defaultHorizontalOffset)
            make.trailing.equalToSuperview().offset(-defaultHorizontalOffset)
            make.bottom.equalToSuperview().offset(-defaultVerticalOffset)
            make.height.equalTo(35)
        }
    }
    
    func update(with item: WeatherPropertyItem) {
        subtitle.text = item.subtitle
        property.text = item.property
    }
}

struct WeatherPropertyItem {
    let subtitle: String
    let property: String
    
    init(subtitle: String, property: String) {
        self.subtitle = subtitle
        self.property = property
    }
}
