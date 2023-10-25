// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'earthquake_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EarthquakeEvent _$EarthquakeEventFromJson(Map<String, dynamic> json) {
  return _EarthquakeEvent.fromJson(json);
}

/// @nodoc
mixin _$EarthquakeEvent {
  String get place => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get mag => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  int get updated => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get tsunami => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EarthquakeEventCopyWith<EarthquakeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarthquakeEventCopyWith<$Res> {
  factory $EarthquakeEventCopyWith(
          EarthquakeEvent value, $Res Function(EarthquakeEvent) then) =
      _$EarthquakeEventCopyWithImpl<$Res, EarthquakeEvent>;
  @useResult
  $Res call(
      {String place,
      String title,
      double mag,
      int time,
      int updated,
      String type,
      int tsunami});
}

/// @nodoc
class _$EarthquakeEventCopyWithImpl<$Res, $Val extends EarthquakeEvent>
    implements $EarthquakeEventCopyWith<$Res> {
  _$EarthquakeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? place = null,
    Object? title = null,
    Object? mag = null,
    Object? time = null,
    Object? updated = null,
    Object? type = null,
    Object? tsunami = null,
  }) {
    return _then(_value.copyWith(
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mag: null == mag
          ? _value.mag
          : mag // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      tsunami: null == tsunami
          ? _value.tsunami
          : tsunami // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EarthquakeEventImplCopyWith<$Res>
    implements $EarthquakeEventCopyWith<$Res> {
  factory _$$EarthquakeEventImplCopyWith(_$EarthquakeEventImpl value,
          $Res Function(_$EarthquakeEventImpl) then) =
      __$$EarthquakeEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String place,
      String title,
      double mag,
      int time,
      int updated,
      String type,
      int tsunami});
}

/// @nodoc
class __$$EarthquakeEventImplCopyWithImpl<$Res>
    extends _$EarthquakeEventCopyWithImpl<$Res, _$EarthquakeEventImpl>
    implements _$$EarthquakeEventImplCopyWith<$Res> {
  __$$EarthquakeEventImplCopyWithImpl(
      _$EarthquakeEventImpl _value, $Res Function(_$EarthquakeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? place = null,
    Object? title = null,
    Object? mag = null,
    Object? time = null,
    Object? updated = null,
    Object? type = null,
    Object? tsunami = null,
  }) {
    return _then(_$EarthquakeEventImpl(
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mag: null == mag
          ? _value.mag
          : mag // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      tsunami: null == tsunami
          ? _value.tsunami
          : tsunami // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EarthquakeEventImpl implements _EarthquakeEvent {
  const _$EarthquakeEventImpl(
      {required this.place,
      required this.title,
      required this.mag,
      required this.time,
      required this.updated,
      required this.type,
      required this.tsunami});

  factory _$EarthquakeEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarthquakeEventImplFromJson(json);

  @override
  final String place;
  @override
  final String title;
  @override
  final double mag;
  @override
  final int time;
  @override
  final int updated;
  @override
  final String type;
  @override
  final int tsunami;

  @override
  String toString() {
    return 'EarthquakeEvent(place: $place, title: $title, mag: $mag, time: $time, updated: $updated, type: $type, tsunami: $tsunami)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarthquakeEventImpl &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.mag, mag) || other.mag == mag) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.tsunami, tsunami) || other.tsunami == tsunami));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, place, title, mag, time, updated, type, tsunami);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EarthquakeEventImplCopyWith<_$EarthquakeEventImpl> get copyWith =>
      __$$EarthquakeEventImplCopyWithImpl<_$EarthquakeEventImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EarthquakeEventImplToJson(
      this,
    );
  }
}

abstract class _EarthquakeEvent implements EarthquakeEvent {
  const factory _EarthquakeEvent(
      {required final String place,
      required final String title,
      required final double mag,
      required final int time,
      required final int updated,
      required final String type,
      required final int tsunami}) = _$EarthquakeEventImpl;

  factory _EarthquakeEvent.fromJson(Map<String, dynamic> json) =
      _$EarthquakeEventImpl.fromJson;

  @override
  String get place;
  @override
  String get title;
  @override
  double get mag;
  @override
  int get time;
  @override
  int get updated;
  @override
  String get type;
  @override
  int get tsunami;
  @override
  @JsonKey(ignore: true)
  _$$EarthquakeEventImplCopyWith<_$EarthquakeEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
