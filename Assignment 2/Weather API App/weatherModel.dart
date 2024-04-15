import 'dart:convert';

WeatherData weatherDataFromJson(String str) =>
    WeatherData.fromJson(json.decode(str));

String weatherDataToJson(WeatherData data) => json.encode(data.toJson());

class WeatherData {
  WeatherCurrent current;
  WeatherForecast forecast;

  WeatherData({
    required this.current,
    required this.forecast,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
    current: WeatherCurrent.fromJson(json['current']),
    forecast: WeatherForecast.fromJson(json['forecast']),
  );

  Map<String, dynamic> toJson() => {
    "current": current.toJson(),
    "forecast": forecast.toJson(),
  };
}

class WeatherCurrent {
  double tempC;
  String icon;
  double windKph;
  double precip;
  int cloud;

  WeatherCurrent({
    required this.tempC,
    required this.icon,
    required this.windKph,
    required this.precip,
    required this.cloud,
  });

  factory WeatherCurrent.fromJson(Map<String, dynamic> json) => WeatherCurrent(
    tempC: json['temp_c'],
    icon: json['condition']['icon'],
    windKph: json['wind_kph'],
    precip: json['precip_mm'],
    cloud: json['cloud'],
  );

  Map<String, dynamic> toJson() => {
    "temp_c": tempC,
    "icon": icon,
    "wind_kph": windKph,
    "precip_mm": precip,
    "cloud": cloud,
  };
}

class WeatherForecast {
  List<ForecastDay> forecastDay;

  WeatherForecast({
    required this.forecastDay,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      WeatherForecast(
        forecastDay: List<ForecastDay>.from(
            json['forecastday'].map((x) => ForecastDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "forecastday": List<dynamic>.from(forecastDay.map((x) => x.toJson())),
  };
}

class ForecastDay {
  String date;
  List<HourWeather> hours;

  ForecastDay({
    required this.date,
    required this.hours,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) => ForecastDay(
    date: json['date'],
    hours: List<HourWeather>.from(
        json['hour'].map((x) => HourWeather.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "hour": List<dynamic>.from(hours.map((x) => x.toJson())),
  };
}

class HourWeather {
  String time;
  double tempC;
  String icon;

  HourWeather({
    required this.time,
    required this.tempC,
    required this.icon,
  });

  factory HourWeather.fromJson(Map<String, dynamic> json) => HourWeather(
    time: json['time'],
    tempC: json['temp_c'],
    icon: json['condition']['icon'],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "temp_c": tempC,
    "icon": icon,
  };
}

// import 'dart:convert';
//
// List<WeatherModel> weatherModelFromJson(String str) => List<WeatherModel>.from(
//     json.decode(str).map((x) => WeatherModel.fromJson(x)));
//
// String weatherModelToJson(List<WeatherModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class WeatherModel {
//   WeatherCurrent current;
//   WeatherForecast forecast;
//
//   WeatherModel({
//     required this.current,
//     required this.forecast,
//   });
//
//   factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
//         current: WeatherCurrent.fromJson(json['current']),
//         forecast: WeatherForecast.fromJson(json['forecast']),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "current": current,
//         // "forecast": forecast,
//       };
// }
//
// class WeatherCurrent {
//   int temperature;
//   List<String> weatherIcons;
//   int windSpeed;
//   double precip;
//   int cloudcover;
//
//   WeatherCurrent({
//     required this.temperature,
//     required this.weatherIcons,
//     required this.windSpeed,
//     required this.precip,
//     required this.cloudcover,
//   });
//
//   factory WeatherCurrent.fromJson(Map<String, dynamic> json) => WeatherCurrent(
//         temperature: json['temperature'],
//         weatherIcons: List<String>.from(json['weather_icons']),
//         windSpeed: json['wind_speed'],
//         precip: json['precip'].toDouble(),
//         cloudcover: json['cloudcover'],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "temperature": temperature,
//         "weather_icons": weatherIcons,
//         "wind_speed": windSpeed,
//         "precip": precip,
//         "cloudcover": cloudcover,
//       };
// }
//
// class WeatherForecast {
//   final String date;
//   final List<HourlyWeather> hourly;
//
//   WeatherForecast({
//     required this.date,
//     required this.hourly,
//   });
//
//   factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
//       WeatherForecast(
//         date: json['date'],
//         hourly: List<HourlyWeather>.from(
//             json['hourly'].map((x) => HourlyWeather.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "date": date,
//         "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
//       };
// }
//
// class HourlyWeather {
//   final int time;
//   final int temperature;
//   final List<String> weatherIcons;
//
//   HourlyWeather({
//     required this.time,
//     required this.temperature,
//     required this.weatherIcons,
//   });
//
//   factory HourlyWeather.fromJson(Map<String, dynamic> json) => HourlyWeather(
//         time: int.parse(json['time']),
//         temperature: json['temperature'],
//         weatherIcons: List<String>.from(json['weather_icons']),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "time": time,
//         "temperature": temperature,
//         "weather_icons": weatherIcons,
//       };
// }
