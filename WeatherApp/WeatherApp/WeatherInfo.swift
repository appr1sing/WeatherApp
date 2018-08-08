//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by Arvin San Miguel on 8/7/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import Foundation

struct WeatherInfo {
    
    let date : String
    let minF : Int
    let maxF : Int
    let minC : Int
    let maxC : Int
    
    init(dict: JSON) {
        self.date = dict["dateTimeISO"] as? String ?? ""
        self.minF = dict["minTempF"] as? Int ?? 0
        self.maxF = dict["maxTempF"] as? Int ?? 0
        self.minC = dict["minTempC"] as? Int ?? 0
        self.maxC = dict["maxTempC"] as? Int ?? 0
    }
    
}

