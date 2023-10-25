import 'package:flutter/material.dart';
import 'package:kalog_batangan_app/screens/earthquake_map.dart';
import 'package:kalog_batangan_app/screens/main.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: EarthquakeMap(),
    );
  }
}
