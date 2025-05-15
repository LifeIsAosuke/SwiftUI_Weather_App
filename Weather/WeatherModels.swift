import SwiftUI

struct CityWeather {
    var cityName: String
    var currentWeather: Weather
    var dailyForecast: DailyForecast
    var weeklyForecast: [DailyForecast]

    init(cityName: String, weeklyForecast: [DailyForecast]) {
        self.cityName = cityName
        currentWeather = weeklyForecast.first!.hourlyWeather.first!
        dailyForecast = weeklyForecast.first!
        self.weeklyForecast = weeklyForecast
    }

    static let tokyo: Self = .init(
        cityName: "Tokyo",
        weeklyForecast: [
            DailyForecast(highestTemperature: 32, lowestTemperature: 24, hourlyWeather: DailyForecast.sampleDailyForecast.hourlyWeather, description: "気温が上昇し、最高気温は33℃の予想です。", day: "今日"),
            DailyForecast(highestTemperature: 30, lowestTemperature: 22, hourlyWeather: DailyForecast.sampleDailyForecast.hourlyWeather, description: "気温が上昇し、最高気温は33℃の予想です。", day: "火"),
            DailyForecast(highestTemperature: 33, lowestTemperature: 25, hourlyWeather: DailyForecast.sampleDailyForecast.hourlyWeather, description: "気温が上昇し、最高気温は33℃の予想です。", day: "水"),
            DailyForecast(highestTemperature: 29, lowestTemperature: 21, hourlyWeather: DailyForecast.sampleDailyForecast.hourlyWeather, description: "気温が上昇し、最高気温は33℃の予想です。", day: "木"),
            DailyForecast(highestTemperature: 28, lowestTemperature: 20, hourlyWeather: DailyForecast.sampleDailyForecast.hourlyWeather, description: "気温が上昇し、最高気温は33℃の予想です。", day: "金"),
            DailyForecast(highestTemperature: 26, lowestTemperature: 20, hourlyWeather: DailyForecast.sampleDailyForecast.hourlyWeather, description: "気温が上昇し、最高気温は33℃の予想です。", day: "土"),
            DailyForecast(highestTemperature: 30, lowestTemperature: 24, hourlyWeather: DailyForecast.sampleDailyForecast.hourlyWeather, description: "気温が上昇し、最高気温は33℃の予想です。", day: "日"),
        ]
    )
}

struct DailyForecast: Identifiable {
    var id: String = UUID().uuidString
    var highestTemperature: Int
    var lowestTemperature: Int
    var hourlyWeather: [Weather]
    var description: String
    var day: String

    static let sampleDailyForecast: Self = .init(highestTemperature: 32, lowestTemperature: 26, hourlyWeather: [
        Weather(hour: 10, temperature: 24, condition: .sunny),
        Weather(hour: 11, temperature: 25, condition: .sunny),
        Weather(hour: 12, temperature: 26, condition: .sunny),
        Weather(hour: 13, temperature: 28, condition: .sunny),
        Weather(hour: 14, temperature: 30, condition: .sunny),
        Weather(hour: 15, temperature: 33, condition: .sunny),
        Weather(hour: 16, temperature: 29, condition: .sunny),
        Weather(hour: 17, temperature: 27, condition: .cloudy),
        Weather(hour: 18, temperature: 27, condition: .cloudy),
        Weather(hour: 19, temperature: 24, condition: .rainy),
        Weather(hour: 20, temperature: 23, condition: .rainy),
        Weather(hour: 21, temperature: 23, condition: .rainy),
        Weather(hour: 22, temperature: 23, condition: .rainy),
        Weather(hour: 23, temperature: 20, condition: .sunny),
        Weather(hour: 0, temperature: 20, condition: .sunny),
        Weather(hour: 1, temperature: 20, condition: .sunny),
        Weather(hour: 2, temperature: 20, condition: .sunny),
    ], description: "気温が上昇し、最高気温は33℃の予想です。", day: "月")
}

struct Weather: Identifiable {
    var id: String = UUID().uuidString
    var hour: Int
    var temperature: Int
    var condition: WeatherCondition

    static let sampleWeather: Self = .init(hour: 10, temperature: 30, condition: .sunny)
}

enum WeatherCondition {
    case sunny
    case cloudy
    case rainy
    case snowy

    var title: String {
        switch self {
        case .sunny:
            "晴れ"
        case .cloudy:
            "曇り"
        case .rainy:
            "雨"
        case .snowy:
            "雪"
        }
    }

    var symbolName: String {
        switch self {
        case .sunny:
            "sun.max.fill"
        case .cloudy:
            "cloud.fill"
        case .rainy:
            "cloud.drizzle.fill"
        case .snowy:
            "cloud.snow.fill"
        }
    }

    var backgroundImageName: String {
        switch self {
        case .sunny:
            ""
        case .cloudy:
            ""
        case .rainy:
            ""
        case .snowy:
            ""
        }
    }
}


