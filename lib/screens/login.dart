import 'package:flutter/material.dart';
import 'package:kalog_batangan_app/widgets/primary_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [PrimaryTextField()],
      ),
    );
  }
}
