import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
            theme: ThemeData(
              textTheme: GoogleFonts.interTextTheme(),
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue
              ),
              appBarTheme: const AppBarTheme(
                color: Colors.blue,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              )
            ),
          );
        }
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
   
  if(condition == null){
    return Colors.blue;
  }

  if (condition == 'Sunny'){
    return Colors.orange;
  }
  
  return Colors.blue;
}