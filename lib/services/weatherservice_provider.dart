import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/secrets/api.dart';
import 'package:http/http.dart' as http;
import '../models/weatherresponse.dart';

class WeatherserviceProvider extends ChangeNotifier {
  WeatherModel? _weatherModel;
  WeatherModel? get weather => _weatherModel;
  bool _isloading = false;
  bool get isloading => _isloading;
  String _error = "";
  String get error => _error;

  Future<void> fetchWeatherDataByCity(String City) async {
    _isloading = true;
    _error = "";
    try {
      // https://api.openweathermap.org/data/2.5/weather?q=dubai&appid=b868b454626dd78ac4eea9f571aa4ce2
      final apiUrl =
          "${APIEndpoints().cityUrl}${City}&appid=${APIEndpoints().apikey}${APIEndpoints().unit}";
      print(apiUrl);
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);

        _weatherModel = WeatherModel.fromJson(data);
        notifyListeners();
      } else {
        _error = "failed to load data";
      }
    } catch (e) {
      _error = "failed to load data $e";
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }
}
