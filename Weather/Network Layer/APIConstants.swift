//
//  WebConstant.swift
//  Currency Convertion
//
//  Created by Akshita Patel on 09/22/23.
//

import Foundation
/**
 This class will handle the API urls
 */

struct APIUrl {
    static let host = "https://api.openweathermap.org/"
    static let appId = "097935719716deb171894ee916540f71"
    static let point = "data/2.5/weather?"
    static let unit = "metric"
    
    static func latlongUrl(lat: Double, long: Double) -> String {
        return host + point + "lat=\(lat)" + "&lon=\(long)" + "&appid=" + appId + "&units=" + unit
    }
    
    static func cityUrl(city: String) -> String {
        return host + point + "q=\(city)" + "&appid=" + appId + "&units=" + unit
    }
}
