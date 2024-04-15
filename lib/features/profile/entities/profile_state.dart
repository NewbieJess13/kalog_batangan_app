import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kalog_batangan_app/models/earthquake_event.dart';
import 'package:kalog_batangan_app/models/user_data.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.init() = ProfileStateInit;
  const factory ProfileState.loading() = ProfileStateLoading;
  const factory ProfileState.data({required UserData user}) = ProfileStateData;
  const factory ProfileState.error({required String message}) =
      ProfileStateError;
}
