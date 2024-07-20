import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  
  final WeatherModel weatherModel;

  const WeatherInfoBody({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            'updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network('https:${weatherModel.image}'),
              Text(
                weatherModel.temp.toString(),
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    "Min. Temp: ${weatherModel.minTemp.round()}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Max. Temp: ${weatherModel.maxTemp.round()}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Text(
            weatherModel.weatherCondition,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

