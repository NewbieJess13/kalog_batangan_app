// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earthquake_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EarthquakeEventImpl _$$EarthquakeEventImplFromJson(
        Map<String, dynamic> json) =>
    _$EarthquakeEventImpl(
      place: json['place'] as String,
      title: json['title'] as String,
      mag: (json['mag'] as num).toDouble(),
      time: json['time'] as int,
      updated: json['updated'] as int,
      type: json['type'] as String,
      tsunami: json['tsunami'] as int,
    );

Map<String, dynamic> _$$EarthquakeEventImplToJson(
        _$EarthquakeEventImpl instance) =>
    <String, dynamic>{
      'place': instance.place,
      'title': instance.title,
      'mag': instance.mag,
      'time': instance.time,
      'updated': instance.updated,
      'type': instance.type,
      'tsunami': instance.tsunami,
    };
