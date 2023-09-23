//
//  MainDetailViewModel.swift
//  Weather
//
//  Created by Akshita Patel on 09/22/23.
//
import UIKit
import Foundation

class MainDetailViewModel: NSObject {
    
    private var mainData: Main?
    
    init(data: Main?) {
        mainData = data
    }
    
    init?(coder aDecoder: NSCoder) {
        //
    }
    
    func encode(with aCoder: NSCoder) {
        //
    }
    
    func getTempView() -> UIView?{
        if let temp = mainData?.temp {
            if let view = Bundle.main.loadNibNamed("MainDetailView", owner: self, options: nil)?.first as? MainDetailView {
                view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                view.title.text = "Temp"
                view.data.text = "\(temp)°C"
                view.imageIcon.loadImageUsingCache(withUrl: "https://openweathermap.org/img/wn/10d.png")
                return view
            }
        }
        return nil
    }
    
    func getFeelsLikeView() -> UIView?{
        if let feelsLike = mainData?.feelsLike {
            if let view = Bundle.main.loadNibNamed("MainDetailView", owner: self, options: nil)?.first as? MainDetailView {
                view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                view.title.text = "Feels Like"
                view.data.text = "\(feelsLike)°C"
                view.imageIcon.loadImageUsingCache(withUrl: "https://openweathermap.org/img/wn/10d.png")
                return view
            }
        }
        return nil
    }
    
    func getHumidityView() -> UIView?{
        if let humidity = mainData?.humidity {
            if let view = Bundle.main.loadNibNamed("MainDetailView", owner: self, options: nil)?.first as? MainDetailView {
                view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                view.title.text = "Humidity"
                view.data.text = "\(humidity)"
                view.imageIcon.loadImageUsingCache(withUrl: "https://openweathermap.org/img/wn/10d.png")
                return view
            }
        }
        return nil
    }
    
    func getPressureView() -> UIView?{
        if let pressure = mainData?.pressure {
            if let view = Bundle.main.loadNibNamed("MainDetailView", owner: self, options: nil)?.first as? MainDetailView {
                view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                view.title.text = "Pressure"
                view.data.text = "\(pressure)"
                view.imageIcon.loadImageUsingCache(withUrl: "https://openweathermap.org/img/wn/10d.png")
            }
        }
        return nil
    }
        
    func getSeaLevelView() -> UIView?{
        if let seaLevel = mainData?.seaLevel {
            if let view = Bundle.main.loadNibNamed("MainDetailView", owner: self, options: nil)?.first as? MainDetailView {
                view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                view.title.text = "Sea Level"
                view.data.text = "\(seaLevel)"
                view.imageIcon.loadImageUsingCache(withUrl: "https://openweathermap.org/img/wn/10d.png")
            }
        }
        return nil
    }
}
