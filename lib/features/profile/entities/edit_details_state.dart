import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kalog_batangan_app/forms/confirm_password.dart';
import 'package:kalog_batangan_app/forms/email.dart';
import 'package:kalog_batangan_app/forms/name.dart';
import 'package:kalog_batangan_app/forms/normal_text.dart';
import 'package:kalog_batangan_app/forms/password.dart';

part 'edit_details_state.freezed.dart';

@freezed
class EditDetailsState with _$EditDetailsState {
  const factory EditDetailsState(
      {@Default(NameFormz.pure()) NameFormz firstName,
      @Default(NameFormz.pure()) NameFormz middleName,
      @Default(NameFormz.pure()) NameFormz lastName,
      @Default(NormalTextFormz.pure()) NormalTextFormz municipality,
      @Default(NormalTextFormz.pure()) NormalTextFormz barangay,
      @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
      @Default(FormzSubmissionStatus.initial)
      FormzSubmissionStatus initDataStatus,
      @Default(false) bool isValid,
      String? errorMessage}) = _EditDetailsState;
}
