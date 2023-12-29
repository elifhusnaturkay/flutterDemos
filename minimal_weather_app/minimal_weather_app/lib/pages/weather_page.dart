import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_weather_app/models/weather_model.dart';
import 'package:minimal_weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api key
  final _weatherService = WeatherService('566cf2ad7895a0b017f5b3e64ec49659');
  Weather? _weather;

  //hava durumunu getir
  _fetchWeather() async {
    //mevcut şehri al
    String cityName = await _weatherService.getCurrentCity();

    //şehrin hava durumunu öğren
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    //any errors
    catch (e) {
      print(e);
    }
  }

  //weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/animations/sunny.json';
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/animations/cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/animations/rainy.json';
      case 'thunderstorm':
        return 'assets/animations/firtina.json';
      case 'clear':
        return 'assets/animations/sunny.json';
      default:
        return 'assets/animations/sunny.json';
    }
  }

  //başlangıç durumu
  @override
  void initState() {
    super.initState();
    //başlangıçta hava durumunu getir
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(184, 201, 201, 201),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //city name
          Text(
            _weather?.cityName ?? "loading city..",
            style: TextStyle(
              fontSize: 37,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 27, 27, 27),
            ),
          ),

          //animations
          Container(
            height: 280,
            width: 280,
            child: Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
          ),

          //temperaturel
          Text('${_weather?.temperature.round()}°C',
              style: TextStyle(
                fontSize: 27,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 27, 27, 27),
              )),

          //weather condition

          Text(_weather?.mainCondition ?? "",
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 27, 27, 27),
              )),
        ]),
      ),
    );
  }
}
