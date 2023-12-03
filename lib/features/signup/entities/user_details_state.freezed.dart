// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserDetailsState {
  NameFormz get firstName => throw _privateConstructorUsedError;
  NameFormz get middleName => throw _privateConstructorUsedError;
  NameFormz get lastName => throw _privateConstructorUsedError;
  NormalTextFormz get municipality => throw _privateConstructorUsedError;
  NormalTextFormz get barangay => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDetailsStateCopyWith<UserDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsStateCopyWith<$Res> {
  factory $UserDetailsStateCopyWith(
          UserDetailsState value, $Res Function(UserDetailsState) then) =
      _$UserDetailsStateCopyWithImpl<$Res, UserDetailsState>;
  @useResult
  $Res call(
      {NameFormz firstName,
      NameFormz middleName,
      NameFormz lastName,
      NormalTextFormz municipality,
      NormalTextFormz barangay,
      FormzSubmissionStatus status,
      bool isValid,
      String? errorMessage});
}

/// @nodoc
class _$UserDetailsStateCopyWithImpl<$Res, $Val extends UserDetailsState>
    implements $UserDetailsStateCopyWith<$Res> {
  _$UserDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? middleName = null,
    Object? lastName = null,
    Object? municipality = null,
    Object? barangay = null,
    Object? status = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as NameFormz,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as NameFormz,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as NameFormz,
      municipality: null == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as NormalTextFormz,
      barangay: null == barangay
          ? _value.barangay
          : barangay // ignore: cast_nullable_to_non_nullable
              as NormalTextFormz,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDetailsStateImplCopyWith<$Res>
    implements $UserDetailsStateCopyWith<$Res> {
  factory _$$UserDetailsStateImplCopyWith(_$UserDetailsStateImpl value,
          $Res Function(_$UserDetailsStateImpl) then) =
      __$$UserDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NameFormz firstName,
      NameFormz middleName,
      NameFormz lastName,
      NormalTextFormz municipality,
      NormalTextFormz barangay,
      FormzSubmissionStatus status,
      bool isValid,
      String? errorMessage});
}

/// @nodoc
class __$$UserDetailsStateImplCopyWithImpl<$Res>
    extends _$UserDetailsStateCopyWithImpl<$Res, _$UserDetailsStateImpl>
    implements _$$UserDetailsStateImplCopyWith<$Res> {
  __$$UserDetailsStateImplCopyWithImpl(_$UserDetailsStateImpl _value,
      $Res Function(_$UserDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? middleName = null,
    Object? lastName = null,
    Object? municipality = null,
    Object? barangay = null,
    Object? status = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$UserDetailsStateImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as NameFormz,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as NameFormz,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as NameFormz,
      municipality: null == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as NormalTextFormz,
      barangay: null == barangay
          ? _value.barangay
          : barangay // ignore: cast_nullable_to_non_nullable
              as NormalTextFormz,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserDetailsStateImpl implements _UserDetailsState {
  const _$UserDetailsStateImpl(
      {this.firstName = const NameFormz.pure(),
      this.middleName = const NameFormz.pure(),
      this.lastName = const NameFormz.pure(),
      this.municipality = const NormalTextFormz.pure(),
      this.barangay = const NormalTextFormz.pure(),
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage});

  @override
  @JsonKey()
  final NameFormz firstName;
  @override
  @JsonKey()
  final NameFormz middleName;
  @override
  @JsonKey()
  final NameFormz lastName;
  @override
  @JsonKey()
  final NormalTextFormz municipality;
  @override
  @JsonKey()
  final NormalTextFormz barangay;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final bool isValid;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'UserDetailsState(firstName: $firstName, middleName: $middleName, lastName: $lastName, municipality: $municipality, barangay: $barangay, status: $status, isValid: $isValid, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsStateImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.municipality, municipality) ||
                other.municipality == municipality) &&
            (identical(other.barangay, barangay) ||
                other.barangay == barangay) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName, middleName, lastName,
      municipality, barangay, status, isValid, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsStateImplCopyWith<_$UserDetailsStateImpl> get copyWith =>
      __$$UserDetailsStateImplCopyWithImpl<_$UserDetailsStateImpl>(
          this, _$identity);
}

abstract class _UserDetailsState implements UserDetailsState {
  const factory _UserDetailsState(
      {final NameFormz firstName,
      final NameFormz middleName,
      final NameFormz lastName,
      final NormalTextFormz municipality,
      final NormalTextFormz barangay,
      final FormzSubmissionStatus status,
      final bool isValid,
      final String? errorMessage}) = _$UserDetailsStateImpl;

  @override
  NameFormz get firstName;
  @override
  NameFormz get middleName;
  @override
  NameFormz get lastName;
  @override
  NormalTextFormz get municipality;
  @override
  NormalTextFormz get barangay;
  @override
  FormzSubmissionStatus get status;
  @override
  bool get isValid;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$UserDetailsStateImplCopyWith<_$UserDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
