import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constant/const.dart';

Widget buildDrawer(var cubit, BuildContext context) {
  return Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: cubit.isDark ? Colors.black26 : Colors.grey.shade200,
            image: const DecorationImage(
              image: AssetImage('assets/images/common/common_book_3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context)!.maktabty,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Color(0xFF9C27B0),
              ),
            ),
          ),
        ),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            cubit.changeScreen(2);
            navigatePop(context);
          },
        ),
        ListTile(
          title: const Text('Library'),
          onTap: () {
            cubit.changeScreen(1);
            navigatePop(context);
          },
        ),
        ListTile(
          title: const Text('Reading'),
          onTap: () {
            cubit.changeScreen(0);
            navigatePop(context);
          },
        ),
        ListTile(
          title: const Text('Payment'),
          onTap: () {
            cubit.changeScreen(3);
            navigatePop(context);
          },
        ),
        ListTile(
          title: const Text('Profile'),
          onTap: () {
            cubit.changeScreen(4);
            navigatePop(context);
          },
        ),
        const Spacer(),
        const Divider(height: 2),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            cubit.changeScreen(4);
            navigatePop(context);
          },
        ),
      ],
    ),
  );
}
