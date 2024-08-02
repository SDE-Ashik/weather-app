import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/screens/home_page.dart';
import 'package:weatherapp/services/location_provider.dart';
import 'package:weatherapp/services/weatherservice_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider(),),
        ChangeNotifierProvider(create: (context)=>WeatherserviceProvider()),
      ],
      child: MaterialApp(
        title: 'Weather app',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor:Colors.transparent,
            
            elevation: 0,
          ),
          
         iconTheme:const IconThemeData(
          color: Colors.white
          
         ),
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}


 