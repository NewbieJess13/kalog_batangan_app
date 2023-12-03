import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kalog_batangan_app/widgets/back_button.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: PrimaryBackButton(),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(40);
}
