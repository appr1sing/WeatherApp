//
//  WeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Arvin San Miguel on 8/8/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    var backGround: UIView = {
        let bg = UIView()
        bg.translatesAutoresizingMaskIntoConstraints = false
        return bg
    }()
    
    var dateLabel: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    var minTempLabel : UILabel = {
        let min = UILabel()
        min.translatesAutoresizingMaskIntoConstraints = false
        return min
    }()
    
    var maxTempLabel : UILabel = {
        let max = UILabel()
        max.translatesAutoresizingMaskIntoConstraints = false
        return max
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) { fatalError("init(coder:)") }
    
    func setupViews() {
        
        contentView.addSubview(backGround)
        backGround.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        backGround.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        backGround.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        backGround.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        backGround.backgroundColor = .white
        backGround.clipsToBounds = true
        backGround.layer.cornerRadius = 14
        backGround.layer.borderWidth = 1.5
        backGround.layer.borderColor = UIColor.black.withAlphaComponent(0.7).cgColor
        backGround.layer.masksToBounds = false
        backGround.layer.shadowColor = UIColor.black.cgColor
        backGround.layer.shadowOpacity = 1
        backGround.layer.shadowOffset = CGSize(width: -1, height: 1)
        backGround.layer.shadowRadius = 3
        
        contentView.addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: backGround.topAnchor, constant: 8).isActive = true
        dateLabel.widthAnchor.constraint(equalTo: backGround.widthAnchor, multiplier: 0.9).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: backGround.centerXAnchor).isActive = true
        dateLabel.font = UIFont(name: "SFCompactDisplay-Light", size: 22)!
        dateLabel.textColor = .black
        dateLabel.text = "08-07-2018"
        
        contentView.addSubview(maxTempLabel)
        maxTempLabel.bottomAnchor.constraint(equalTo: backGround.bottomAnchor, constant: -8).isActive = true
        maxTempLabel.widthAnchor.constraint(equalTo: backGround.widthAnchor, multiplier: 0.9).isActive = true
        maxTempLabel.centerXAnchor.constraint(equalTo: backGround.centerXAnchor).isActive = true
        maxTempLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        maxTempLabel.font = UIFont(name: "SFCompactDisplay-Light", size: 22)!
        maxTempLabel.textColor = .black
        maxTempLabel.text = "16˚"
        maxTempLabel.textAlignment = .left
        
        contentView.addSubview(minTempLabel)
        minTempLabel.bottomAnchor.constraint(equalTo: backGround.bottomAnchor, constant: -8).isActive = true
        minTempLabel.widthAnchor.constraint(equalTo: backGround.widthAnchor, multiplier: 0.9).isActive = true
        minTempLabel.centerXAnchor.constraint(equalTo: backGround.centerXAnchor).isActive = true
        minTempLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        minTempLabel.font = UIFont(name: "SFCompactDisplay-Light", size: 22)!
        minTempLabel.textColor = .black
        minTempLabel.text = "89˚"
        minTempLabel.textAlignment = .right
        
        
    }
}
