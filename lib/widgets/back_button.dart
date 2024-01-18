import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PrimaryBackButton extends StatelessWidget {
  const PrimaryBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Ionicons.chevron_back),
      onPressed: () => Navigator.pop(context),
    );
  }
}
