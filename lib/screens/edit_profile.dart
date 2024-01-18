import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:kalog_batangan_app/providers/auth_provider.dart';
import 'package:kalog_batangan_app/widgets/appbar.dart';
import 'package:kalog_batangan_app/widgets/back_button.dart';
import 'package:kalog_batangan_app/widgets/primary_button.dart';
import 'package:kalog_batangan_app/widgets/primary_textfield.dart';

class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({super.key});
  static get routeName => 'edit_profile';
  static get routeLocation => '/edit_profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailsState = ref.watch(userDetailsProvider);
    final userDetailsEvents = ref.read(userDetailsProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const MainAppBar(
        title: "Edit Profile",
        leading: PrimaryBackButton(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryTextField(
                label: 'First name',
                initVal: "Juan",
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
                initVal: "Dela Cruz",
                isRequired: true,
                validator: (value) =>
                    userDetailsState.lastName.error?.getMessage(),
                onChanged: (value) => userDetailsEvents.updateLastName(value),
              ),
              PrimaryTextField(
                label: 'Municipality',
                initVal: "Lipa",
                isRequired: true,
                validator: (value) =>
                    userDetailsState.municipality.error?.getMessage(),
                onChanged: (value) =>
                    userDetailsEvents.updateMunicipality(value),
              ),
              PrimaryTextField(
                label: 'Barangay',
                initVal: "Sabang",
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
        title: 'Save',
        isLoading: userDetailsState.status == FormzSubmissionStatus.inProgress,
        onPressed: userDetailsState.isValid
            ? () => userDetailsEvents.proceedToSignup(context)
            : null,
      ),
    );
  }
}
