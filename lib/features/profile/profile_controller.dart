import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalog_batangan_app/features/profile/entities/profile_state.dart';
import 'package:kalog_batangan_app/features/signup/entities/user_details_state.dart';
import 'package:kalog_batangan_app/models/user_data.dart';
import 'package:kalog_batangan_app/providers/auth_provider.dart';
import 'package:kalog_batangan_app/repositories/user.dart';

final profileNotifierProvider =
    StateNotifierProvider.autoDispose<ProfileController, ProfileState>((ref) {
  final String uid = ref.watch(authProvider).value!.uid;
  final notifier = ProfileController(ref.watch(userRepoProvider), uid);
  notifier.getUserDetails();
  return notifier;
});

class ProfileController extends StateNotifier<ProfileState> {
  ProfileController(this._userRepository, this.uid)
      : super(const ProfileState.init());

  final UserRepository _userRepository;
  final String uid;

  void getUserDetails() async {
    state = const ProfileState.loading();

    try {
      UserData? user = await _userRepository.getUserDetails(uid);
      if (user != null) {
        state = ProfileState.data(user: user);
      } else {
        state =
            const ProfileState.error(message: "Error in fetching user details");
      }
    } catch (e) {
      state =
          const ProfileState.error(message: "Error in fetching user details");
    }
  }
}
