//
//  APIManager.swift
//  Currency Convertion
//
//  Created by Akshita Patel on 09/22/23.
//

import Foundation
class APIManager {
    func getWeatherForLocation(lat: Double, long: Double, completion: @escaping(Base?, Error?)->Void) {
        //this will get data as per lat long
        NetworkManager.shared.request(APIUrl.latlongUrl(lat: lat, long: long)) { (result: Result<Base, NetworkError>) in
            switch result {
                case .success(let base):
                    print("Received post:", base)
                    completion(base, nil)
                case .failure(let error):
                    print("Error:", error)
                    completion(nil, error)
            }
        }
    }

    func getWeatherForCity(city: String, completion: @escaping(Base?, Error?)->Void) {
        // this will get data as per city name
        NetworkManager.shared.request(APIUrl.cityUrl(city: city)) { (result: Result<Base, NetworkError>) in
            switch result {
            case .success(let base):
                print("Received Weather:", base)
                completion(base, nil)
            case .failure(let error):
                print("Error:", error)
                completion(nil, error)
            }
        }
    }
}


