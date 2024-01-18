import 'package:cloud_firestore/cloud_firestore.dart';

// @freezed
class EarthquakeEventModel {
  // final String place;

  final String? id;
  final String? date;
  final String? time;
  final String? location;
  final String? depthOfFocus;
  final String? origin;
  final String? magnitude;
  final String? expectAfterShocks;
  final String? expectDamage;

  EarthquakeEventModel({
    this.id,
    this.date,
    this.time,
    this.location,
    this.depthOfFocus,
    this.origin,
    this.magnitude,
    this.expectAfterShocks,
    this.expectDamage,
  });

  factory EarthquakeEventModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    if (data == null) {
      return EarthquakeEventModel();
    }
    return EarthquakeEventModel(
        id: data['id'],
        date: data['date'],
        time: data['time'],
        location: data['location'],
        depthOfFocus: data['depth_of_focus'],
        origin: data['origin'],
        magnitude: data['magnitude'],
        expectAfterShocks: data['expect_aftershocks'],
        expectDamage: data['expect_damage']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (date != null) "date": date,
      if (time != null) "time": time,
      if (location != null) "location": location,
      if (depthOfFocus != null) "depth_of_focus": depthOfFocus,
      if (origin != null) "origin": origin,
      if (magnitude != null) "magnitude": magnitude,
      if (expectAfterShocks != null) "expect_aftershocks": expectAfterShocks,
      if (expectDamage != null) "expect_damage": expectDamage,
    };
  }
}
