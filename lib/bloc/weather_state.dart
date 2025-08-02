import 'package:my_weather_app/model/weather_data_model.dart';

abstract class WeatherState {}

class InitialWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class SuccessWeatherState extends WeatherState {
  WeatherDataModel weatherDataModel;
  SuccessWeatherState({required this.weatherDataModel});
}

class ErrorWeatherState extends WeatherState {
  String errorMessage;
  ErrorWeatherState({required this.errorMessage});
}
