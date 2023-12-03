import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static get routeName => 'splash';
  static get routeLocation => '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('welcome'),
      ),
    );
  }
}
