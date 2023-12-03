import 'package:cloud_firestore/cloud_firestore.dart';

// @freezed
class EarthquakeEvent {
  // final String place;

  final String? id;
  final String? dateTime;
  final String? location;
  final String? depthOfFocus;
  final String? origin;
  final String? magnitude;

  EarthquakeEvent(
      {this.id,
      this.dateTime,
      this.location,
      this.depthOfFocus,
      this.origin,
      this.magnitude});

  factory EarthquakeEvent.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    if (data == null) {
      return EarthquakeEvent();
    }
    return EarthquakeEvent(
        id: data['id'],
        dateTime: data['datetime'],
        location: data['location'],
        depthOfFocus: data['depth_of_focus'],
        origin: data['origin'],
        magnitude: data['magnitude']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (dateTime != null) "datetime": dateTime,
      if (location != null) "location": location,
      if (depthOfFocus != null) "depth_of_focus": depthOfFocus,
      if (origin != null) "origin": origin,
      if (magnitude != null) "magnitude": magnitude,
    };
  }
}
