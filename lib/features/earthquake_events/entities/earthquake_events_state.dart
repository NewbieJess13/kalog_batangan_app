import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kalog_batangan_app/models/earthquake_event.dart';

part 'earthquake_events_state.freezed.dart';

@freezed
class EarthquakeEventsState with _$EarthquakeEventsState {
  const factory EarthquakeEventsState.init() = EarthquakeEventsStateInit;
  const factory EarthquakeEventsState.loading() = EarthquakeEventsStateLoading;
  const factory EarthquakeEventsState.data(
          {required List<EarthquakeEventModel> earthquakeEvents}) =
      EarthquakeEventsStateData;
  const factory EarthquakeEventsState.error({required String message}) =
      EarthquakeEventsStateError;
}
