import 'package:flutter/material.dart';

import 'app_colors.dart';

PreferredSizeWidget CustomAppBar(BuildContext context, String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(color: AppColors.white),
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.notifications_outlined),
        onPressed: () {},
      ),
    ],
  );
}
