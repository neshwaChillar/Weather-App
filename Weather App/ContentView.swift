//
//  ContentView.swift
//  Weather App
//
//  Created by Neshwa on 29/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundGradientView(isNight: isNight)
            VStack {
                CityNameView(cityName: "India, IN")
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                HStack(spacing: 15) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: isNight ? "moon.fill" : "cloud.sun.fill",
                                   temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: isNight ? "moon.dust.fill" : "cloud.sun.rain.fill"
                                   , temperature: 60)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: isNight ? "cloud.moon.bolt.fill" : "wind.snow",
                                   temperature: 45)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: isNight ? "wind.snow" : "sunset.fill",
                                   temperature: 50)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: isNight ? "cloud.bolt.fill" : "snow",
                                   temperature: 20)
                }
                .padding(.bottom, 80)
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 32))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundGradientView: View {
    
    var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
//        ContainerRelativeShape()
//            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
//            .ignoresSafeArea()
    }
}

struct CityNameView: View {
    
    var cityName : String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 20)
    }
}


