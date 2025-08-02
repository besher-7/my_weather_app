import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/bloc/weather_cubit.dart';
import 'package:my_weather_app/bloc/weather_state.dart';
import 'package:my_weather_app/pages/result_page.dart';

import '../core/constants/app_images.dart';

class FetchingDataPage extends StatelessWidget {
  FetchingDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            //'Pacifico' X => AppConstants.pacifico
            image: AssetImage(AppImages.backGroundImage),
            fit: BoxFit.cover,
            opacity: 0.85,
          ),
        ),
        child: Center(
          child: BlocConsumer<WeatherCubit, WeatherState>(
            builder: (BuildContext context, WeatherState state) {
              if (state is LoadingWeatherState) {
                return CircularProgressIndicator();
              } else {
                return MaterialButton(
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    context.read<WeatherCubit>().getTemperatureCubit();
                  },
                  color: Colors.indigo,
                  child: Text(
                    'Get Temperature',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                );
              }
            },
            listener: (BuildContext context, WeatherState state) {
              if (state is ErrorWeatherState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }
              if (state is SuccessWeatherState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Done Successfully'),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResultPage(state.weatherDataModel),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
