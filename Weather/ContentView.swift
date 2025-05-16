//
//  ContentView.swift
//  Weather
//
//  Created by A S on 2025/05/16.
//

import SwiftUI

struct ContentView: View {
    
    @State var cityWeather : CityWeather = .tokyo
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            ScrollView{
                VStack {
                    
                    Text(cityWeather.cityName)
                        .font(.system(size: 48, weight: .light))
                    Text("\(cityWeather.dailyForecast.hourlyWeather.first!.temperature)")
                        .font(.system(size: 96, weight: .thin))
                    HStack {
                        Text("最高")
                        Text("\(cityWeather.dailyForecast.highestTemperature)°")
                        Text("最低")
                        Text("\(cityWeather.dailyForecast.lowestTemperature)°")
                    }
                }
                
                VStack(spacing: 8) {
                    
                    Text(cityWeather.dailyForecast.description)
                        .font(.system(size:16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16){
                            ForEach(cityWeather.dailyForecast.hourlyWeather) { weather in
                                VStack(spacing: 8) {
                                    
                                    Text("\(weather.hour):00")
                                        .font(.system(size: 16))
                                    
                                    Image(systemName: weather.condition.symbolName)
                                        .font(.system(size: 28))
                                        .symbolRenderingMode(.multicolor)
                                    
                                    Text("\(weather.temperature)°")
                                        .font(.system(size: 20))
                                }
                                .frame(width: 60)
                            }
                        }
                    }
                }
                .padding(10)
                .background(Color.black.opacity(0.1))
                .cornerRadius(16)
                .padding(.horizontal, 24)
                
                LazyVStack(spacing: 20) {
                    Text("七日間の天気予報")
                    Divider()
                    ForEach(cityWeather.weeklyForecast) { forecast in
                        HStack(spacing: 16) {
                            
                            Text(forecast.day)
                                .frame(width:40, alignment: .leading)
                            
                            Image(systemName: forecast.hourlyWeather.first!.condition.symbolName)
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 24))
                            
                            VStack() {
                                Text("最低 最高 ")
                                Text("\(forecast.lowestTemperature)° \(forecast.highestTemperature)°")
                            }
                            VStack {
                                
                                Text("最高気温ゲージ")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                
                                Gauge(value: Double(forecast.highestTemperature), in: 25...35) {}
                                    .gaugeStyle(.accessoryLinear) // 横長ゲージ
                                    .tint(Gradient(colors: [.yellow, .orange])) // ゲージの色
                                    .frame(width: 120) // ゲージの幅
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                            }
                        }
                        Divider()
                    }
                }
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(16)
                .padding(.horizontal,24)
            }
        }
        .foregroundColor(.white)
        .shadow(radius : 3)
    }
}

#Preview {
    ContentView()
}
