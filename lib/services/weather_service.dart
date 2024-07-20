import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {

  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '933b5f32fe394ab98e8123652241807';

  WeatherService({required this.dio});

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    
    try {
      var response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
      return WeatherModel.fromjson(response.data);
    } 
    on DioException catch(e){
      final String errorMessage = e.response?.data['error']['message'] ?? "Oops there was an error";
      throw Exception(errorMessage);
    }
    catch(e){
      log(e.toString());
      throw Exception("Oops there was an error");
    }
  }
}