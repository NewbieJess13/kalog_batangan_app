import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static get routeName => 'splash';
  static get routeLocation => '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/taal_icon.png',
              height: 60,
              width: 60,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Kalog Batangan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    );
  }
}
