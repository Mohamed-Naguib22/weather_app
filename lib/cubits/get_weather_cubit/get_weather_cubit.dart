import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());

  getWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel = await WeatherService(dio: Dio()).getWeatherData(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel));  
    }
    catch(e) {
      emit(WeatherFailureState(errorMessage: e.toString()));  
    }
  }
}