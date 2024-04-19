import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:kalog_batangan_app/features/profile/entities/edit_details_state.dart';
import 'package:kalog_batangan_app/forms/name.dart';
import 'package:kalog_batangan_app/forms/normal_text.dart';
import 'package:kalog_batangan_app/models/user_data.dart';
import 'package:kalog_batangan_app/providers/auth_provider.dart';
import 'package:kalog_batangan_app/repositories/user.dart';

final editProfileNotifierProvider =
    StateNotifierProvider.autoDispose<EditProfileController, EditDetailsState>(
        (ref) {
  final String uid = ref.watch(authProvider).value!.uid;
  final notifier = EditProfileController(ref.watch(userRepoProvider), uid);
  notifier.getUserDetails();
  return notifier;
});

class EditProfileController extends StateNotifier<EditDetailsState> {
  EditProfileController(this._userRepository, this.uid)
      : super(const EditDetailsState());

  final UserRepository _userRepository;
  final String uid;

  void initValues(UserData initialVal) {
    final firstName = NameFormz.dirty(initialVal.firstName!);
    final middleName = NameFormz.dirty(initialVal.lastName!);
    final lastName = NameFormz.dirty(initialVal.lastName!);
    final municipality = NormalTextFormz.dirty(initialVal.cityMunicipality!);
    final barangay = NormalTextFormz.dirty(initialVal.barangay!);
    state = state.copyWith(
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      municipality: municipality,
      barangay: barangay,
      isValid: Formz.validate([
        firstName,
        // state.middleName,
        state.lastName,
        state.municipality,
        state.barangay
      ]),
    );
  }

  void updateFirstName(String value) {
    final firstName = NameFormz.dirty(value);
    state = state.copyWith(
      firstName: firstName,
      isValid: Formz.validate([
        firstName,
        // state.middleName,
        state.lastName,
        state.municipality,
        state.barangay
      ]),
    );
  }

  void updateMiddleName(String value) {
    final middleName = NameFormz.dirty(value);
    state = state.copyWith(
      middleName: middleName,
      isValid: Formz.validate([
        state.firstName,
        // middleName,
        state.lastName,
        state.municipality,
        state.barangay
      ]),
    );
  }

  void updateLastName(String value) {
    final lastName = NameFormz.dirty(value);
    state = state.copyWith(
      lastName: lastName,
      isValid: Formz.validate([
        state.firstName,
        // middleName,
        lastName,
        state.municipality,
        state.barangay
      ]),
    );
  }

  void updateMunicipality(String value) {
    final municipality = NormalTextFormz.dirty(value);
    state = state.copyWith(
      municipality: municipality,
      isValid: Formz.validate([
        state.firstName,
        // middleName,
        state.lastName,
        municipality,
        state.barangay
      ]),
    );
  }

  void updateBarangay(String value) {
    final barangay = NormalTextFormz.dirty(value);
    state = state.copyWith(
      barangay: barangay,
      isValid: Formz.validate([
        state.firstName,
        // middleName,
        state.lastName,
        state.municipality,
        barangay
      ]),
    );
  }

  void updateUserDetails(UserData user) async {
    if (!state.isValid) return;
    state = state.copyWith(status: FormzSubmissionStatus.inProgress);

    try {
      await _userRepository.saveUserDetails(user, uid);
      state = state.copyWith(status: FormzSubmissionStatus.success);
    } on FirebaseException catch (e) {
      state = state.copyWith(
          errorMessage: e.message, status: FormzSubmissionStatus.failure);
    }
  }

  void getUserDetails() async {
    state = state.copyWith(initDataStatus: FormzSubmissionStatus.inProgress);

    try {
      UserData? user = await _userRepository.getUserDetails(uid);
      if (user != null) {
        final firstName = NameFormz.dirty(user.firstName!);
        final middleName = NameFormz.dirty(user.lastName!);
        final lastName = NameFormz.dirty(user.lastName!);
        final municipality = NormalTextFormz.dirty(user.cityMunicipality!);
        final barangay = NormalTextFormz.dirty(user.barangay!);
        state = state.copyWith(
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            municipality: municipality,
            barangay: barangay,
            isValid: Formz.validate([
              firstName,
              lastName,
              municipality,
              barangay,
            ]),
            status: FormzSubmissionStatus.success,
            initDataStatus: FormzSubmissionStatus.success);
      }
    } catch (e) {
      state = state.copyWith(status: FormzSubmissionStatus.failure);
    }
  }
}
