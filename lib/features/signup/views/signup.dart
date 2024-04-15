import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kalog_batangan_app/constants/string_const.dart';
import 'package:kalog_batangan_app/models/user_data.dart';
import 'package:kalog_batangan_app/providers/auth_provider.dart';
import 'package:kalog_batangan_app/widgets/appbar.dart';
import 'package:kalog_batangan_app/widgets/back_button.dart';
import 'package:kalog_batangan_app/widgets/password_textfield.dart';
import 'package:kalog_batangan_app/widgets/phone_number_input.dart';
import 'package:kalog_batangan_app/widgets/primary_button.dart';
import 'package:kalog_batangan_app/widgets/primary_textfield.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});
  static get routeName => 'signup';
  static get routeLocation => '/signup';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupState = ref.watch(signUpProvider);
    final signupEvents = ref.read(signUpProvider.notifier);
    final userDetailsState = ref.read(userDetailsProvider);
    ref.listen(
        signUpProvider,
        (prev, next) => switch (next.status) {
              FormzSubmissionStatus.failure => ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content:
                        Text(next.errorMessage ?? 'Authentication Failure'),
                  ),
                ),
              FormzSubmissionStatus.success => 'context.go(Home.routeLocation)',
              _ => FormzSubmissionStatus.initial
            });
    return Scaffold(
      appBar: const MainAppBar(
        leading: PrimaryBackButton(),
        showInfo: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Scrollbar(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account Creation',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Enter your email, password and contact number to finalize your account',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                PrimaryTextField(
                  label: StringConst.emailText,
                  inputType: TextInputType.emailAddress,
                  isRequired: true,
                  validator: (value) => signupState.email.error?.getMessage(),
                  onChanged: (value) => signupEvents.updateEmail(value),
                ),
                PasswordTextField(
                  label: StringConst.passwordText,
                  obscureText: signupState.hidePassword,
                  isRequired: true,
                  onChanged: (value) => signupEvents.updatePassword(value),
                  validator: (value) =>
                      signupState.password.error?.getMessage(),
                  hideShowPassword: () =>
                      signupEvents.showHidePassword(signupState.hidePassword),
                ),
                PasswordTextField(
                  label: StringConst.confirmPasswordText,
                  obscureText: signupState.hideConfirmPassword,
                  isRequired: true,
                  onChanged: (value) =>
                      signupEvents.updateConfirmPassword(value),
                  validator: (value) =>
                      signupState.confirmPassword.error?.getMessage(),
                  hideShowPassword: () => signupEvents
                      .showHideConfirmPassword(signupState.hideConfirmPassword),
                ),
                PhoneNumberInput(
                  title: 'Phone number',
                  onChanged: (PhoneNumber number) =>
                      signupEvents.updatePhone(number.phoneNumber!),
                  validator: (value) => signupState.phone.error?.getMessage(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        title: 'Sign Up',
        isLoading: signupState.status == FormzSubmissionStatus.inProgress,
        onPressed: signupState.isValid
            ? () {
                final UserData user = UserData(
                    firstName: userDetailsState.firstName.value,
                    middleName: userDetailsState.middleName.value,
                    lastName: userDetailsState.lastName.value,
                    cityMunicipality: userDetailsState.municipality.value,
                    barangay: userDetailsState.barangay.value,
                    emailAddress: signupState.email.value,
                    phoneNumber: signupState.phone.value);

                signupEvents.signupUser(user);
              }
            : null,
      ),
    );
  }
}
