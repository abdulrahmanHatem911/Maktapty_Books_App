// this screen for the cubit
import 'package:bloc/bloc.dart';
import 'package:book/l10n/l10n.dart';
import 'package:book/layout/cubit/state.dart';
import 'package:book/modules/screens/home_screen.dart';
import 'package:book/modules/screens/library_screen.dart';
import 'package:book/modules/screens/payment_screen.dart';
import 'package:book/modules/screens/profile_screen.dart';
import 'package:book/modules/screens/reading_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/network/remote/api_constant.dart';
import '../../core/network/remote/dio_helper.dart';
import '../../core/style/theme.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());
  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);

  // for the theme in the app
  static ThemeData theme = BookTheme.light();
  // for dark theme
  static ThemeData darkTheme = BookTheme.dark();

  // for pageController
  static PageController pageController = PageController();
  int currentIndex = 2;
  List<Widget> screen = const [
    LibraryScreen(),
    ReadingScreen(),
    HomeScreen(),
    PaymentScreen(),
    ProfileScreen(),
  ];
  // change screen
  void changeScreen(int index) {
    currentIndex = index;
    emit(LayoutChangeScreenState());
  }

  // change language
  Locale _locale = Locale('en');
  Locale get locale => _locale;
  void setLocale(Locale language) {
    if (!L10n.all.contains(language)) return;
    _locale = language;
    emit(LayoutChangeLanguageState());
  }

  void clearLocal() {
    _locale.toString() != '';
    emit(LayoutClearTheLocalState());
  }

  // to change the theme
  late bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(LayoutChangeModeState());
    } else {
      isDark = !isDark;
      emit(LayoutChangeModeState());
    }
  }

// change icon in password
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LayoutChangePasswordVisibilityState());
  }

  List<dynamic> libraryData = [];
  List<dynamic> downloadData = [];
  // list 1🚀
  // to get data from HardcoverFiction
  List<dynamic> dataHardcoverFiction = [];

  void getDataHardcoverFiction() {
    emit(LayoutGetCurrentHardcoverFictionDataLoadingState());
    DioHelper.getData(
      url: ApiConstant.HEDER_COVER_FICTION,
    ).then((value) {
      dataHardcoverFiction = value.data['results']['books'];
      getLibraryData(dataHardcoverFiction);
      emit(LayoutGetCurrentHardcoverFictionDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutGetCurrentHardcoverFictionDataErrorState());
    });
  }

  // list 2 🎳
  // to get data from HardcoverFiction
  List<dynamic> dataManga = [];
  void getDataManga() {
    emit(LayoutGetCurrentMangaDataLoadingState());
    DioHelper.getData(
      url: ApiConstant.MANGA,
    ).then((value) {
      dataManga = value.data['results']['books'];
      getLibraryData(dataManga);
      emit(LayoutGetCurrentMangaDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutGetCurrentMangaDataErrorState());
    });
  }

  // list 3 💎
  // to get data from HardcoverFiction
  List<dynamic> dataPictureBooks = [];
  void getDataPictureBooks() {
    emit(LayoutGetCurrentPictureBooksDataLoadingState());
    DioHelper.getData(
      url: ApiConstant.PICKER_BOOK,
    ).then((value) {
      dataPictureBooks = value.data['results']['books'];
      getLibraryData(dataPictureBooks);
      emit(LayoutGetCurrentPictureBooksDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutGetCurrentPictureBooksDataErrorState());
    });
  }

  // list 4 🔥
  // to get data from HardcoverFiction
  List<dynamic> dataScience = [];
  void getDataScience() {
    emit(LayoutGetCurrentScienceDataLoadingState());
    DioHelper.getData(
      url: ApiConstant.SCIENCE,
    ).then((value) {
      dataScience = value.data['results']['books'];
      getLibraryData(dataScience);
      emit(LayoutGetCurrentScienceDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutGetCurrentScienceDataErrorState());
    });
  }

  // list 5 🎿
  // to get data from HardcoverFiction
  List<dynamic> dataSports = [];
  void getDataSports() {
    emit(LayoutGetCurrentSportsDataLoadingState());
    DioHelper.getData(
      url: ApiConstant.SPORT,
    ).then((value) {
      dataSports = value.data['results']['books'];
      getLibraryData(dataSports);
      emit(LayoutGetCurrentSportsDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutGetCurrentSportsDataErrorState());
    });
  }

  // for getLibraryData
  void getLibraryData(List data) {
    emit(LayoutGetLibraryDataLoadingState());
    libraryData.insertAll(0, data);
    emit(LayoutGetLibraryDataSuccessState());
  }

  // for download list
  void getDownloadList(Map<String, dynamic> model) {
    emit(LayoutGetDownloadDataLoadingState());
    downloadData = model['buy_links'];
    emit(LayoutGetDownloadDataSuccessState());
  }

  // function to lanch url
  Future<void> launchURLBrowser(String urlData) async {
    emit(LayoutLaunchURLBrowserLoadingState());
    var url = Uri.parse(urlData);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      emit(LayoutLaunchURLBrowserSuccessState());
    } else {
      emit(LayoutLaunchURLBrowserErrorState());
      throw 'Could not launch $url';
    }
  }

  List favoriteData = [];
  void getFavoriteData(dynamic model) {
    emit(LayoutGetFavoriteDataLoadingState());
    favoriteData.add(model);
    print('favoriteData length ${favoriteData.length}');
    emit(LayoutGetFavoriteDataSuccessState());
  }
}
