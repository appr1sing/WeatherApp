//
//  Parser.swift
//  WeatherApp
//
//  Created by Arvin San Miguel on 8/7/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import Foundation

class Worker {
    
    static func parse(_ data: JSON) -> [WeatherInfo] {
        
        var results = [WeatherInfo]()
        
        guard let response = data["response"] as? NSArray else { fatalError("Error in parsing") }
        guard let items = response as? [JSON] else { fatalError("Error in parsing") }
        
        for item in items {
            for (key,value) in item {
                if key == "periods" {
                    if let info = value as? NSArray {
                        guard let newData = info as? [JSON] else { fatalError() }
                        
                        newData.forEach { jsonData in
                            results.append(WeatherInfo(dict: jsonData))
                        }
                    }
                }
            }
        }
        return results
    }
    
}
