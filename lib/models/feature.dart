import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kalog_batangan_app/models/earthquake_event.dart';
import 'package:kalog_batangan_app/models/geometry.dart';

part 'feature.freezed.dart';
part 'feature.g.dart';

@freezed
class Feature with _$Feature {
  const factory Feature({
    required EarthquakeEvent properties,
    required Geometry geometry,
  }) = _Feature;

  factory Feature.fromJson(Map<String, Object?> json) =>
      _$FeatureFromJson(json);
}
