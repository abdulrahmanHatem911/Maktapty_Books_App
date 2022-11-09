import 'package:book/core/style/app_color.dart';

import '../core/components/drawer.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  static String getLanguage(String code, context) {
    switch (code) {
      case 'ar':
        return AppLocalizations.of(context)!.arabic;
      case 'en':
        return AppLocalizations.of(context)!.english;
      default:
        return AppLocalizations.of(context)!.arabic;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              AppLocalizations.of(context)!.maktabty,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.purple,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.mode_night, color: Colors.grey.shade400),
                onPressed: () {
                  cubit.changeAppMode();
                },
              ),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: cubit.locale,
                    onTap: () {
                      cubit.setLocale(const Locale('ar'));
                    },
                    child: Text(AppLocalizations.of(context)!.arabic),
                  ),
                  PopupMenuItem(
                    value: cubit.locale,
                    onTap: () {
                      cubit.setLocale(const Locale('en'));
                    },
                    child: Text(AppLocalizations.of(context)!.english),
                  )
                ],
              ),
            ],
          ),
          body: cubit.screen[cubit.currentIndex],
          drawer: buildDrawer(cubit, context),
          bottomNavigationBar: CurvedNavigationBar(
            index: cubit.currentIndex,
            onTap: (index) {
              setState(() {
                cubit.changeScreen(index);
              });
            },
            color:
                cubit.isDark ? const Color(0xff5c5757) : Colors.grey.shade500,
            buttonBackgroundColor: AppColor.perper,
            backgroundColor: cubit.isDark
                ? const Color(0xff303030)
                : const Color(0xfffafafa),
            height: 60,
            items: const [
              Icon(
                Icons.chrome_reader_mode,
                color: Colors.white,
              ),
              Icon(
                Icons.book,
                color: Colors.white,
              ),
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.shopping_cart_sharp,
                color: Colors.white,
              ),
              Icon(
                Icons.person,
                color: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
