import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/bloc/weather_state.dart';

import '../core/location_manager.dart';
import '../core/server_manager.dart';
import '../model/weather_data_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitialWeatherState());

  LocationManager locationManager = LocationManager();
  ServerManager serverManager = ServerManager();

  Future getTemperatureCubit() async {
    emit(LoadingWeatherState());
    await locationManager.getLocation();
    try {
      WeatherDataModel m1 = await serverManager.getTemperature(
          lon: locationManager.longitude!, lat: locationManager.latitude!);
      emit(SuccessWeatherState(weatherDataModel: m1));
    } catch (e) {
      emit(ErrorWeatherState(errorMessage: e.toString()));
    }
  }
}
