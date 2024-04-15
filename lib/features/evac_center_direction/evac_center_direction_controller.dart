import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kalog_batangan_app/errors/service_error.dart';
import 'package:kalog_batangan_app/features/evac_center_direction/entities/evac_center_direction_state.dart';
import 'package:kalog_batangan_app/services/location_service.dart';

final evacCenterDirectionStateProvider = StateNotifierProvider.autoDispose<
    EvacCenterDirectionController, EvacCenterDirectionState>((ref) {
  final notifier =
      EvacCenterDirectionController(ref.read(locationServiceProvider));
  notifier.init();
  return notifier;
});

class EvacCenterDirectionController
    extends StateNotifier<EvacCenterDirectionState> {
  EvacCenterDirectionController(this._locationService)
      : super(EvacCenterDirectionState.initial());

  final LocationService _locationService;

  init() async {
    final result = await _locationService.getLocation();

    result.fold((success) {
      success.listen((pos) {
        state = state.copyWith(currentPos: pos);
      });

      // print(success.);
    }, (error) {
      state = state.copyWith(error: error);
    });
  }
}
