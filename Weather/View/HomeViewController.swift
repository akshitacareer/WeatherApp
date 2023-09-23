//
//  WeatherViewController.swift
//  Weather
//
//  Created by Akshita Patel on 09/22/23.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var temprature: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var weather: UILabel!
    
    @IBOutlet weak var clouds: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    
    @IBOutlet weak var smallWeatherIcon: UIImageView!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    @IBOutlet weak var seachTextField: UITextField!
    
    private var weatherViewModel : WeatherViewModel!
    private var mainDetailViewModel : MainDetailViewModel!
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        callToViewModelForUIUpdate()
    }
    
    func setUpLocation() {
        //this will setup the current location
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func callToViewModelForUIUpdate() {
        //this will setup the weather view model
        self.weatherViewModel = WeatherViewModel()
        self.weatherViewModel.bindWeatherViewModelToController = {
            //update the UI once data retrieved from API
            self.updateWeatherData()
        }
        
        if self.weatherViewModel.cityName.isEmpty {
            //get location only when no city searched previously
            setUpLocation()
        }
    }
    
    func updateWeatherData() {
        // Update the UI on main thread
        DispatchQueue.main.async {
            self.stopActivityIndicator()
            self.seachTextField.text = self.weatherViewModel.cityName
            self.city.text = self.weatherViewModel.base?.name
            self.temprature.text = "\(self.weatherViewModel.base?.main.temp ?? 0)"
            
            self.windSpeed.text = "\(self.weatherViewModel.base?.wind.speed ?? 0)"
            
            if let weather = self.weatherViewModel.base?.weather.first {
                
                self.clouds.text = weather.clouddescription
                self.weatherIcon.loadIconWithName(name: weather.icon)
                self.smallWeatherIcon.loadIconWithName(name: weather.icon)
            }
            
            self.generateBottomView()
        }
    }
    
    func generateBottomView() {
        //this will generate the bottom view with data
        mainDetailViewModel = MainDetailViewModel(data: self.weatherViewModel.base?.main)
        
        for subview in bottomStackView.arrangedSubviews {
            //removed previously added view when search city again to handle data
            subview.removeFromSuperview()
        }
        
        if let tempView = mainDetailViewModel.getTempView() {
            bottomStackView.addArrangedSubview(tempView)
        }
        
        if let feelsLikeView = mainDetailViewModel.getFeelsLikeView() {
            bottomStackView.addArrangedSubview(feelsLikeView)
        }
        
        if let humidityView = mainDetailViewModel.getHumidityView() {
            bottomStackView.addArrangedSubview(humidityView)
        }
        
        if let pressureView = mainDetailViewModel.getPressureView() {
            bottomStackView.addArrangedSubview(pressureView)
        }
        
        if let seaLevelView = mainDetailViewModel.getSeaLevelView() {
            bottomStackView.addArrangedSubview(seaLevelView)
        }
    }
    
    @IBAction func searchButtonTapped() {
        //this will called when click on seach button
        if weatherViewModel.isSearching {
            if let searchText = self.seachTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
                if searchText.count>0 {
                    startActivityIndicator()
                    self.weatherViewModel.cityName = searchText
                }
            }
        }
        weatherViewModel.isSearching.toggle()
        UIView.animate(withDuration: 0.3) {
            self.seachTextField.alpha = self.weatherViewModel.isSearching ? 1.0 : 0.0
            self.seachTextField.isHidden = !self.weatherViewModel.isSearching
        }
    }
}


extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        // Access the user's location data from the 'location' object
        if !self.weatherViewModel.onlyOnceForCurrentLocation {
            //set the location data to get weather data from user's location
            self.weatherViewModel.location = location
            self.weatherViewModel.onlyOnceForCurrentLocation = true
        }
    }
}
