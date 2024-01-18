import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kalog_batangan_app/widgets/back_button.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, this.height = 60, this.title, this.leading});
  final double height;
  final String? title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: title == null
          ? null
          : Text(
              title ?? '',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
