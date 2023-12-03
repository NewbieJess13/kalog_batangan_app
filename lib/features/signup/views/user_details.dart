import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:kalog_batangan_app/providers/auth_provider.dart';
import 'package:kalog_batangan_app/widgets/appbar.dart';
import 'package:kalog_batangan_app/widgets/back_button.dart';
import 'package:kalog_batangan_app/widgets/primary_button.dart';
import 'package:kalog_batangan_app/widgets/primary_textfield.dart';

class UserDetailsPage extends ConsumerWidget {
  const UserDetailsPage({super.key});
  static get routeName => 'user_details';
  static get routeLocation => '/user_details';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailsState = ref.watch(userDetailsProvider);
    final userDetailsEvents = ref.read(userDetailsProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const MainAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      'Personal Information',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Enter your personal details for us to know you better',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
              PrimaryTextField(
                label: 'First name',
                isRequired: true,
                validator: (value) =>
                    userDetailsState.firstName.error?.getMessage(),
                onChanged: (value) => userDetailsEvents.updateFirstName(value),
              ),
              PrimaryTextField(
                label: 'Middle name',
                validator: (value) =>
                    userDetailsState.middleName.error?.getMessage(),
                onChanged: (value) => userDetailsEvents.updateMiddleName(value),
              ),
              PrimaryTextField(
                label: 'Last name',
                isRequired: true,
                validator: (value) =>
                    userDetailsState.lastName.error?.getMessage(),
                onChanged: (value) => userDetailsEvents.updateLastName(value),
              ),
              PrimaryTextField(
                label: 'Municipality',
                isRequired: true,
                validator: (value) =>
                    userDetailsState.municipality.error?.getMessage(),
                onChanged: (value) =>
                    userDetailsEvents.updateMunicipality(value),
              ),
              PrimaryTextField(
                label: 'Barangay',
                isRequired: true,
                validator: (value) =>
                    userDetailsState.barangay.error?.getMessage(),
                onChanged: (value) => userDetailsEvents.updateBarangay(value),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        title: 'Next',
        isLoading: userDetailsState.status == FormzSubmissionStatus.inProgress,
        onPressed: userDetailsState.isValid
            ? () => userDetailsEvents.proceedToSignup(context)
            : null,
      ),
    );
  }
}
