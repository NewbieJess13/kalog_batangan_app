import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kalog_batangan_app/models/evac_center.dart';

part 'evac_center_state.freezed.dart';

@freezed
class EvacCenterState with _$EvacCenterState {
  const factory EvacCenterState.init() = EvacCenterStateInit;
  const factory EvacCenterState.loading() = EvacCenterStateLoading;
  const factory EvacCenterState.data(
      {required List<EvacCenterModel> centers,
      EvacCenterModel? selectedCenter}) = EvacCenterStateData;
  const factory EvacCenterState.error({required String message}) =
      EvacCenterStateError;
}
