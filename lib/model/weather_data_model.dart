class WeatherDataModel {
  double temp;
  String statue;
  String location;

  WeatherDataModel({
    required this.location,
    required this.statue,
    required this.temp,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> j) {
    return WeatherDataModel(
      location: j['name'],
      statue: j['weather'][0]['main'],
      temp: j['main']['temp'],
    );
  }
}
