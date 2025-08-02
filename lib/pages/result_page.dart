import 'package:flutter/material.dart';
import 'package:my_weather_app/model/weather_data_model.dart';

import '../core/constants/app_images.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.weatherDataModel);

  WeatherDataModel weatherDataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backGroundImage),
            fit: BoxFit.cover,
            opacity: 0.85,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  weatherDataModel.temp.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 55),
                ),
                Text(
                  weatherDataModel.statue,
                  style: TextStyle(
                      color: Colors.white, fontSize: 50, letterSpacing: 4),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  weatherDataModel.location,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
