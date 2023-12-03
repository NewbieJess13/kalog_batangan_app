import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, this.isLoading = false, this.onPressed, required this.title});

  final bool isLoading;
  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.green[100]),
            onPressed: onPressed,
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(
                    title,
                    style: TextStyle(fontSize: 18),
                  )),
      ),
    );
  }
}
