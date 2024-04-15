import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_directions/google_maps_directions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kalog_batangan_app/models/evac_center.dart';
import 'package:kalog_batangan_app/services/location_service.dart';
import 'package:kalog_batangan_app/widgets/appbar.dart';
import 'package:kalog_batangan_app/widgets/back_button.dart';

class EvacuationCenterDirectionPage extends StatefulWidget {
  const EvacuationCenterDirectionPage({required this.evacCenter, super.key});

  final EvacCenterModel evacCenter;

  static get routeName => 'evac_center_direction';
  static get routeLocation => '/evac_center_direction';

  @override
  State<EvacuationCenterDirectionPage> createState() =>
      _EvacuationCenterDirectionPageState();
}

class _EvacuationCenterDirectionPageState
    extends State<EvacuationCenterDirectionPage> {
  String? _platformVersion;
  String? _instruction;

  final _origin = WayPoint(
      name: "Way Point 1",
      latitude: 13.9738767,
      longitude: 121.1663467,
      isSilent: true);
  final _destination = WayPoint(
      name: "Evacuation Center",
      latitude: 13.9753797,
      longitude: 121.1677442,
      isSilent: false);

  bool _isMultipleStop = false;
  double? _distanceRemaining, _durationRemaining;
  MapBoxNavigationViewController? _controller;
  bool _routeBuilt = false;
  bool _isNavigating = false;
  bool _inFreeDrive = false;
  late MapBoxOptions _navigationOption;

  @override
  void initState() {
    initialize();

    // userLoc = LatLng(13.9738767, 121.1663467);
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initialize() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    _navigationOption = MapBoxNavigation.instance.getDefaultOptions();
    _navigationOption.simulateRoute = true;
    _navigationOption.language = "en";
    //_navigationOption.initialLatitude = 36.1175275;
    //_navigationOption.initialLongitude = -115.1839524;
    MapBoxNavigation.instance.registerRouteEventListener(_onEmbeddedRouteEvent);

    String? platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await MapBoxNavigation.instance.getPlatformVersion();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> _onEmbeddedRouteEvent(e) async {
    _distanceRemaining = await MapBoxNavigation.instance.getDistanceRemaining();
    _durationRemaining = await MapBoxNavigation.instance.getDurationRemaining();

    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        var progressEvent = e.data as RouteProgressEvent;
        if (progressEvent.currentStepInstruction != null) {
          _instruction = progressEvent.currentStepInstruction;
        }
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        setState(() {
          _routeBuilt = true;
        });
        break;
      case MapBoxEvent.route_build_failed:
        setState(() {
          _routeBuilt = false;
        });
        break;
      case MapBoxEvent.navigation_running:
        setState(() {
          _isNavigating = true;
        });
        break;
      case MapBoxEvent.on_arrival:
        if (!_isMultipleStop) {
          await Future.delayed(const Duration(seconds: 3));
          await _controller?.finishNavigation();
        } else {}
        break;
      case MapBoxEvent.navigation_finished:
      case MapBoxEvent.navigation_cancelled:
        setState(() {
          _routeBuilt = false;
          _isNavigating = false;
        });
        break;
      default:
        break;
    }
    setState(() {});
  }

  // @override
  // void dispose() {
  //   pos.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: widget.evacCenter.evacCenterName,
        leading: PrimaryBackButton(),
      ),
      body: Stack(
        children: [
          MapBoxNavigationView(
              options: _navigationOption,
              onRouteEvent: _onEmbeddedRouteEvent,
              onCreated: (MapBoxNavigationViewController controller) {
                _controller = controller;
                controller.initialize();
              }),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: 200,
                  height: 80,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade100),
                      onPressed: () async {
                        var wayPoints = <WayPoint>[];
                        wayPoints.add(_origin);
                        wayPoints.add(WayPoint(
                            name: "Evacuation Center",
                            latitude: widget.evacCenter.location?.latitude,
                            longitude: widget.evacCenter.location?.longitude,
                            isSilent: false));
                        var opt = MapBoxOptions.from(_navigationOption);
                        opt.simulateRoute = true;
                        opt.voiceInstructionsEnabled = true;
                        opt.bannerInstructionsEnabled = true;
                        opt.units = VoiceUnits.metric;
                        await MapBoxNavigation.instance.startNavigation(
                            wayPoints: wayPoints, options: opt);
                      },
                      child: Text(
                        'Start Navigating',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      )),
                ),
              ))
        ],
      ),
    );
  }
}
