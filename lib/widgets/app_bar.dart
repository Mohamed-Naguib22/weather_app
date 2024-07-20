import 'package:flutter/material.dart';

class WeatherAppBar extends StatelessWidget {
  const WeatherAppBar({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}