import 'package:flutter/material.dart';
import 'package:kalog_batangan_app/source/phivolcs_data_scrape.dart';

class EarthquakeEventPage extends StatefulWidget {
  const EarthquakeEventPage({super.key});

  @override
  State<EarthquakeEventPage> createState() => _EarthquakeEventPageState();
}

class _EarthquakeEventPageState extends State<EarthquakeEventPage> {
  @override
  void initState() {
    PhivolcsDataScrape.getPhivolcsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
