import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kalog_batangan_app/features/login/login.dart';
import 'package:kalog_batangan_app/features/profile/profile_controller.dart';
import 'package:kalog_batangan_app/features/profile/views/edit_profile.dart';
import 'package:kalog_batangan_app/providers/auth_provider.dart';
import 'package:kalog_batangan_app/repositories/authentication.dart';
import 'package:kalog_batangan_app/widgets/appbar.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  static get routeName => 'profile';
  static get routeLocation => '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileProvider = ref.watch(profileNotifierProvider);
    return Scaffold(
      extendBody: true,
      appBar: MainAppBar(
        title: "Profile",
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return profileProvider.maybeWhen(
              data: (user) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${user.firstName} ${user.lastName}",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 30),
                      ),
                      Text(
                        user.emailAddress!,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 25),
                      ),
                      Text(
                        user.cityMunicipality!,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 25),
                      ),
                      Text(
                        '${user.phoneNumber!.substring(0, user.phoneNumber!.length - 5)}*****',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton.icon(
                          onPressed: () {
                            context.push(EditProfilePage.routeLocation,
                                extra: user);
                          },
                          icon: Icon(Ionicons.pencil_outline),
                          label: Text('Edit Profile')),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                );
              },
              error: (message) {
                return Center(
                  child: Text(message),
                );
              },
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
              orElse: SizedBox.shrink);
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(width: 2, color: Colors.red.shade700)),
            onPressed: () async {
              AuthenticationRepository auth =
                  AuthenticationRepository(FirebaseAuth.instance);

              await auth.logout();

              context.go(LoginPage.routeLocation);
            },
            child: Text(
              'Log Out',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.red.shade700),
            )),
      ),
    );
  }
}
