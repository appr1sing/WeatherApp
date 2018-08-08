//
//  AerisAPIClient.swift
//  WeatherApp
//
//  Created by Arvin San Miguel on 8/7/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import Foundation
typealias JSON = [ String : Any ]


struct AerisAPIClient {
    
    static let shared = AerisAPIClient()
    
    private init() {}
    
    func requestWeatherData(_ completion: @escaping (JSON) -> ()) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let urlString = Secret.url + Secret.id + "&" + Secret.key
        let url = URL(string: urlString)
        let task = session.dataTask(with: url!) { data, response, error in
            
            guard let data = data else { fatalError("Error in downloading.")}
            guard let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as! JSON else { return }
            
            OperationQueue.main.addOperation {
                completion(responseJSON)
            }
        }
        task.resume()
        
    }
    
}
