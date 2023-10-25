import 'package:flutter/material.dart';
import 'package:kalog_batangan_app/source/usgs_api.dart';

class EarthquakeMap extends StatefulWidget {
  const EarthquakeMap({super.key});

  @override
  State<EarthquakeMap> createState() => _EarthquakeMapState();
}

class _EarthquakeMapState extends State<EarthquakeMap> {
  @override
  void initState() {
    UsgsApi.getEarthquakeEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
