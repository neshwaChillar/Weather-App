//
//  WeatherButton.swift
//  Weather App
//
//  Created by Neshwa on 29/11/23.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor, backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 40)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
