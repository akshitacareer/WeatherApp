//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Akshita Patel on 09/22/23.
//

import Foundation
import CoreLocation

class WeatherViewModel {
    
    private var apiService : APIManager!
    
    private let userDefaultsManager: UserDefaultsManager = UserDefaultsManagerImpl.shared
    
    var isSearching = false
    
    var onlyOnceForCurrentLocation = false
    
    var cityName: String = "" {
        didSet{
            //handle the city name value change
            self.saveCityName()
            callFunctionToGetWeatherForCity()
        }
    }
    
    var location: CLLocation? {
        didSet{
            //handle location change
            self.callFuncToGetWeatherData()
        }
    }
    var bindWeatherViewModelToController : (() -> ()) = {}
    
    private(set) var base : Base?{
        didSet{
            //update the UI when data updated
            self.bindWeatherViewModelToController()
        }
    }
    
    init() {
        self.apiService = APIManager()
//        callFuncToGetWeatherData()
        if let cityName = getLastCityName() {
            //get data for last saved city
            self.cityName = cityName
            self.callFunctionToGetWeatherForCity()
        }
    }
    
    private func callFuncToGetWeatherData()  {
        //get data for location
        if let location = location {
            self.apiService.getWeatherForLocation(lat:location.coordinate.latitude , long: location.coordinate.longitude) { base, error in
                if error == nil {
                    self.base = base
                }
            }
        }
    }
    
    private func callFunctionToGetWeatherForCity() {
        //get data for city name
        self.apiService.getWeatherForCity(city: self.cityName) { base, error in
            self.base = base
        }
    }
    
    func getLastCityName() -> String? {
        return userDefaultsManager.get("last_searched_city")
    }
    
    func saveCityName() {
        userDefaultsManager.set(self.cityName, forKey: "last_searched_city")
    }
}
