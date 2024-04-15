import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:kalog_batangan_app/constants/string_const.dart';
import 'package:kalog_batangan_app/features/signup/views/user_details.dart';
import 'package:kalog_batangan_app/providers/auth_provider.dart';
import 'package:kalog_batangan_app/features/signup/views/signup.dart';
import 'package:kalog_batangan_app/screens/main.dart';
import 'package:kalog_batangan_app/widgets/password_textfield.dart';
import 'package:kalog_batangan_app/widgets/primary_button.dart';
import 'package:kalog_batangan_app/widgets/primary_textfield.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  static get routeName => 'login';
  static get routeLocation => '/login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final loginEvents = ref.read(loginProvider.notifier);
    ref.listen(
        loginProvider,
        (prev, next) => switch (next.status) {
              FormzSubmissionStatus.failure => ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content:
                        Text(next.errorMessage ?? 'Authentication Failure'),
                  ),
                ),
              FormzSubmissionStatus.success =>
                context.go(MainPage.routeLocation),
              _ => FormzSubmissionStatus.initial
            });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
                Text(
                  'Sign in to get the latest earthquake events in Batangas',
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
            // type: TextInputType.emailAddress,
            isRequired: true,
            validator: (value) => loginState.email.error?.getMessage(),
            onChanged: (value) => loginEvents.updateEmail(value),
          ),
          PasswordTextField(
            label: StringConst.passwordText,
            obscureText: loginState.hidePassword,
            isRequired: true,
            onChanged: (value) => loginEvents.updatePassword(value),
            validator: (value) => loginState.password.error?.getMessage(),
            hideShowPassword: () =>
                loginEvents.showHidePassword(loginState.hidePassword),
          ),
          SizedBox(
            height: 30,
          ),
          PrimaryButton(
              title: StringConst.loginText,
              isLoading: loginState.status == FormzSubmissionStatus.inProgress,
              onPressed: loginState.isValid
                  ? () => loginEvents.loginWithEmailAndPassword()
                  : null),
          Center(
            child: TextButton(
                onPressed: () => context.push(UserDetailsPage.routeLocation),
                child: Text(StringConst.signUpText)),
          ),
          // Spacer(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/logos/phivolcs.png",
              width: 200,
              height: 80,
            ),
            Image.asset(
              "assets/logos/batangas_logo.jpg",
              width: 80,
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
