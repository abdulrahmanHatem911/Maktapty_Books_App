import 'package:book/layout/home_layout.dart';
import 'package:book/modules/screens/onboarding_screen.dart';

import 'core/services/cache_helper.dart';
import 'l10n/l10n.dart';
import 'modules/login/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/remote/dio_helper.dart';
import 'layout/cubit/cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'layout/cubit/state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  //data in cache
  var isLogin = CacheHelper.getData(key: 'isLogin');
  var onboarding = CacheHelper.getData(key: 'onBoarding');
  Widget widget;
  if (onboarding != null || onboarding == false) {
    if (isLogin != null) {
      widget = const LayoutScreen();
    } else {
      widget = const LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }
  runApp(MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({Key? key, required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LayoutCubit>(
      lazy: true,
      // هنا انا بجيب الداتا وانا جاي افتح التطبيق
      create: (context) => LayoutCubit()
        ..getDataHardcoverFiction()
        ..getDataManga()
        ..getDataPictureBooks()
        ..getDataScience()
        ..getDataSports(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: cubit.locale,
            supportedLocales: L10n.all,
            debugShowCheckedModeBanner: false,
            theme: LayoutCubit.theme,
            darkTheme: LayoutCubit.darkTheme,
            themeMode: LayoutCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
