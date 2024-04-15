import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kalog_batangan_app/screens/info_screen.dart';
import 'package:kalog_batangan_app/widgets/back_button.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar(
      {super.key,
      this.height = 60,
      this.title,
      this.leading,
      this.onTap,
      this.showInfo = true});
  final double height;
  final String? title;
  final Widget? leading;
  final VoidCallback? onTap;
  final bool showInfo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.green.shade100,
      title: Row(
        children: [
          Image.asset(
            'assets/icons/taal_icon.png',
            height: 40,
            width: 40,
          ),
          ...[
            const SizedBox(
              width: 10,
            ),
            if (title != null)
              Expanded(
                child: Text(
                  title ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
          ]
        ],
      ),
      actions: [
        if (showInfo) ...[
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(
                Icons.send,
                color: Colors.green,
                size: 40,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.push(InfoScreen.routeLocation);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(
                Icons.help_rounded,
                color: Colors.green,
                size: 40,
              ),
            ),
          )
        ]
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
