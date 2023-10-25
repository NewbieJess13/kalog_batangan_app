import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kalog_batangan_app/models/geometry.dart';

part 'earthquake_event.freezed.dart';
part 'earthquake_event.g.dart';

@freezed
class EarthquakeEvent with _$EarthquakeEvent {
  // final String place;

  const factory EarthquakeEvent(
      {required String place,
      required String title,
      required double mag,
      required int time,
      required int updated,
      required String type,
      required int tsunami}) = _EarthquakeEvent;

  factory EarthquakeEvent.fromJson(Map<String, Object?> json) =>
      _$EarthquakeEventFromJson(json);
}
