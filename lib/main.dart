import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/bloc/weather_cubit.dart';
import 'package:my_weather_app/pages/fetching_data_page.dart';
import 'package:my_weather_app/pages/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit(),
      /*MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => WeatherCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => WeatherCubit(),
        ),
      ],*/
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FetchingDataPage(),
      ),
    );
  }
}

// https://www.appicon.co/
// https://nikhilsomansahu.medium.com/a-step-by-step-guide-to-adding-launcher-icons-to-your-flutter-app-98b5d7e3bb04
// package name => flutter_launcher_icons
