import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalog_batangan_app/features/earthquake_events/entities/earthquake_events_state.dart';
import 'package:kalog_batangan_app/models/earthquake_event.dart';
import 'package:kalog_batangan_app/repositories/earthquake_events.dart';

final earthquakeEventsNotifierProvider = StateNotifierProvider.autoDispose<
    EarthquakeEventsController, EarthquakeEventsState>((ref) {
  final notifier =
      EarthquakeEventsController(ref.watch(earthquakeEventRepoProvider));
  notifier._init();
  return notifier;
});

class EarthquakeEventsController extends StateNotifier<EarthquakeEventsState> {
  EarthquakeEventsController(this._authenticationRepository)
      : super(const EarthquakeEventsState.init());

  final EarthquakeEventsRepository _authenticationRepository;

  Future<void> _init() async {
    state = const EarthquakeEventsState.loading();
    final events = await _authenticationRepository.getEvents();
    // print(events);
    state = EarthquakeEventsState.data(earthquakeEvents: events);
  }

  Stream<List<EarthquakeEventModel>> eventStream() {
    return _authenticationRepository.stream();
  }
}
