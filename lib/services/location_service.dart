import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kalog_batangan_app/errors/service_error.dart';

final locationServiceProvider = Provider.autoDispose<LocationService>((ref) {
  final locService = LocationService();

  return locService;
});

const LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.bestForNavigation,
  distanceFilter: 100,
);

class LocationService {
  Future<Either<Stream<Position>, ServiceError>> getLocation() async {
    bool locationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationEnabled) {
      return const Right(ServiceError(
          title: "Location",
          message: "Location Service is disabled. Please turn on"));
    }

    LocationPermission location = await Geolocator.checkPermission();
    if (location == LocationPermission.denied) {
      location = await Geolocator.requestPermission();
      if (location == LocationPermission.denied) {
        return const Right(ServiceError(
            title: "Permission Error",
            message: "Location is denied, please allow it in settings"));
      }
    }

    if (location == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return const Right(ServiceError(
          title: "Permission Error",
          message: "Location is denied forever, This feature will not work."));
    }
    print(location);
    Stream<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings);
    //         .listen((Position? position) {
    //   print(position == null
    //       ? 'Unknown'
    //       : 'lat: ${position.latitude.toString()}, long: ${position.longitude.toString()}');
    // });

    return Left(positionStream);
  }
}
