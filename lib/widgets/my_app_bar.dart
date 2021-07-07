import 'package:flutter/material.dart';
import 'package:qist/shared/style.dart';

import '../shared/const.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      title: Text(
        appName,
        style: TextStyle(
          color: appBarTitleColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
