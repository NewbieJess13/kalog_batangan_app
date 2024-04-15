import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kalog_batangan_app/features/earthquake_events/entities/earthquake_events_state.dart';
import 'package:kalog_batangan_app/features/evac_centers/entities/evac_center_state.dart';
import 'package:kalog_batangan_app/global_providers.dart';
import 'package:kalog_batangan_app/models/evac_center.dart';
import 'package:kalog_batangan_app/repositories/evac_center.dart';
import 'package:kalog_batangan_app/services/location_service.dart';

final evacCenterStateProvider =
    StateNotifierProvider.autoDispose<EvacCenterController, EvacCenterState>(
        (ref) {
  final notifier =
      EvacCenterController(EvacCenterRepository(ref.read(firestoreProvider)));
  notifier.init();
  return notifier;
});

class EvacCenterController extends StateNotifier<EvacCenterState> {
  EvacCenterController(this._evacCenterRepository)
      : super(const EvacCenterState.init());

  final EvacCenterRepository _evacCenterRepository;
  late BitmapDescriptor marker;

  EvacCenterModel? selectedCenter;
  late List<EvacCenterModel> evacCenters;

  Future init() async {
    state = const EvacCenterState.loading();
    await getMarker();
    evacCenters = await _evacCenterRepository.getCenters();
    state = EvacCenterState.data(centers: evacCenters);
  }

  void setSelectedCenter(EvacCenterModel center) {
    selectedCenter = center;
    state = EvacCenterState.data(
        centers: evacCenters, selectedCenter: selectedCenter);
  }

  Future<BitmapDescriptor> getMarker() async =>
      marker = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(100, 100)),
          "assets/icons/evac_icon_marker.png");
}
