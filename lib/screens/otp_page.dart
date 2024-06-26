import 'package:flutter/material.dart';
import 'package:kalog_batangan_app/models/user_data.dart';
import 'package:kalog_batangan_app/widgets/primary_button.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, this.user});
  final UserData? user;

  static get routeName => 'otp_page';
  static get routeLocation => '/otp_page';

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  void initState() {
    // test();
    super.initState();
  }

  Future test() async {
    if (widget.user != null) {
      // await FbAuth.verifyPhoneNumber(widget.user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Verification',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              'Please input the 6 digit code sent to your sms',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Pinput(
              length: 6,
            ),
            SizedBox(
              height: 15,
            ),
            Text('Did not receive the code? Resend in 50 seconds'),
            Spacer(),
            PrimaryButton(
              title: 'Verify',
            )
          ],
        ),
      ),
    );
  }
}
