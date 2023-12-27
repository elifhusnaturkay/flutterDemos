import 'package:flutter/material.dart';
import 'package:minimal_weather_app/models/weather_model.dart';
import 'package:minimal_weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

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
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //city name
          Text(_weather?.cityName ?? "loading city.."),

          //temperature
          Text('${_weather?.temperature.round()}C')
        ]),
      ),
    );
  }
}
