import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:kalog_batangan_app/features/signup/entities/user_details_state.dart';
import 'package:kalog_batangan_app/features/signup/views/signup.dart';
import 'package:kalog_batangan_app/forms/name.dart';
import 'package:kalog_batangan_app/forms/normal_text.dart';

class UserDetailsController extends StateNotifier<UserDetailsState> {
  UserDetailsController() : super(const UserDetailsState());

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

  void proceedToSignup(BuildContext context) {
    if (!state.isValid) return;
    context.push(SignUpPage.routeLocation);

    state = state.copyWith(status: FormzSubmissionStatus.success);
  }
}
