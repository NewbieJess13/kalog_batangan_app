import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kalog_batangan_app/screens/edit_profile.dart';
import 'package:kalog_batangan_app/widgets/appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static get routeName => 'profile';
  static get routeLocation => '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Profile",
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Juan Dela Cruz',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
            Text(
              'Juan@gmail.com',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            Text(
              'Lipa city',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            Text(
              '+6395******12',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton.icon(
                onPressed: () {
                  context.push(EditProfilePage.routeLocation);
                },
                icon: Icon(Ionicons.pencil_outline),
                label: Text('Edit Profile')),
            Spacer(),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 2, color: Colors.red.shade700)),
                onPressed: () {},
                child: Text(
                  'Log Out',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.red.shade700),
                )),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
