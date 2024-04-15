import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:kalog_batangan_app/features/profile/edit_profile_controller.dart';
import 'package:kalog_batangan_app/models/user_data.dart';
import 'package:kalog_batangan_app/providers/auth_provider.dart';
import 'package:kalog_batangan_app/widgets/appbar.dart';
import 'package:kalog_batangan_app/widgets/back_button.dart';
import 'package:kalog_batangan_app/widgets/primary_button.dart';
import 'package:kalog_batangan_app/widgets/primary_textfield.dart';

class EditProfilePage extends ConsumerWidget {
  const EditProfilePage(this.user, {super.key});
  static get routeName => 'edit_profile';
  static get routeLocation => '/edit_profile';

  final UserData user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editDetailsState = ref.watch(editProfileNotifierProvider);
    final editDetailsEvents = ref.read(editProfileNotifierProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const MainAppBar(
        title: "Edit Profile",
        leading: PrimaryBackButton(),
      ),
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          print(editDetailsState.initDataStatus);
          switch (editDetailsState.initDataStatus) {
            case FormzSubmissionStatus.initial:
            case FormzSubmissionStatus.canceled:
              break;
            case FormzSubmissionStatus.inProgress:
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            case FormzSubmissionStatus.success:
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryTextField(
                      label: 'First name',
                      initVal: user.firstName,
                      isRequired: true,
                      validator: (value) =>
                          editDetailsState.firstName.error?.getMessage(),
                      onChanged: (value) =>
                          editDetailsEvents.updateFirstName(value),
                    ),
                    PrimaryTextField(
                      label: 'Middle name',
                      initVal: user.middleName,
                      validator: (value) =>
                          editDetailsState.middleName.error?.getMessage(),
                      onChanged: (value) =>
                          editDetailsEvents.updateMiddleName(value),
                    ),
                    PrimaryTextField(
                      label: 'Last name',
                      initVal: user.lastName,
                      isRequired: true,
                      validator: (value) =>
                          editDetailsState.lastName.error?.getMessage(),
                      onChanged: (value) =>
                          editDetailsEvents.updateLastName(value),
                    ),
                    PrimaryTextField(
                      label: 'Municipality',
                      initVal: user.cityMunicipality,
                      isRequired: true,
                      validator: (value) =>
                          editDetailsState.municipality.error?.getMessage(),
                      onChanged: (value) =>
                          editDetailsEvents.updateMunicipality(value),
                    ),
                    PrimaryTextField(
                      label: 'Barangay',
                      initVal: user.barangay,
                      isRequired: true,
                      validator: (value) =>
                          editDetailsState.barangay.error?.getMessage(),
                      onChanged: (value) =>
                          editDetailsEvents.updateBarangay(value),
                    ),
                  ],
                ),
              );
            case FormzSubmissionStatus.failure:
              Text('Failed to load user details');
            // TODO: Handle this case.
          }
          return SizedBox.shrink();
        }),
      ),
      bottomNavigationBar: PrimaryButton(
        title: 'Update',
        isLoading: editDetailsState.status == FormzSubmissionStatus.inProgress,
        onPressed: editDetailsState.isValid
            ? () {
                final UserData user = UserData(
                  firstName: editDetailsState.firstName.value,
                  middleName: editDetailsState.middleName.value,
                  lastName: editDetailsState.lastName.value,
                  cityMunicipality: editDetailsState.municipality.value,
                  barangay: editDetailsState.barangay.value,
                );
                editDetailsEvents.updateUserDetails(user);
                context.pop(true);
              }
            : null,
      ),
    );
  }
}
