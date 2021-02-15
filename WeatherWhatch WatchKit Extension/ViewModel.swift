//
//  ViewModel.swift
//  WeatherWhatch WatchKit Extension
//
//  Created by Sofi on 12.02.2021.
//

import Foundation
import SwiftUI
import SwiftyJSON
import Alamofire




class Weath: ObservableObject {
    @Published var m:[Model] = []
    func GetWeath()  {
        let url = "https://api.weatherapi.com/v1/current.json?key=34de8e48d0944de6a83131619202610&q=Oslo"
        AF.request(url, method: .get).validate().responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.m.append(Model(nam: json["location"]["name"].stringValue, scor: json["current"]["wind_kph"].stringValue, wheth: json["current"]["condition"]["text"].stringValue, temp: json["current"]["temp_c"].stringValue))
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }

    }
}

