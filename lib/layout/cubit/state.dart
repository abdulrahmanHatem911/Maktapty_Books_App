abstract class LayoutState {}

class LayoutInitialState extends LayoutState {}

class LayoutChangeScreenState extends LayoutState {}

class LayoutChangeLanguageState extends LayoutState {}

class LayoutClearTheLocalState extends LayoutState {}

// to change the theme
class LayoutChangeModeState extends LayoutState {}

class LayoutChangePasswordVisibilityState extends LayoutState {}

// for get data from api
class LayoutGetCurrentHardcoverFictionDataSuccessState extends LayoutState {}

class LayoutGetCurrentHardcoverFictionDataErrorState extends LayoutState {}

class LayoutGetCurrentHardcoverFictionDataLoadingState extends LayoutState {}

// for get data from api
class LayoutGetCurrentMangaDataSuccessState extends LayoutState {}

class LayoutGetCurrentMangaDataErrorState extends LayoutState {}

class LayoutGetCurrentMangaDataLoadingState extends LayoutState {}

// for
class LayoutGetCurrentPictureBooksDataLoadingState extends LayoutState {}

class LayoutGetCurrentPictureBooksDataSuccessState extends LayoutState {}

class LayoutGetCurrentPictureBooksDataErrorState extends LayoutState {}

// for since
class LayoutGetCurrentScienceDataLoadingState extends LayoutState {}

class LayoutGetCurrentScienceDataSuccessState extends LayoutState {}

class LayoutGetCurrentScienceDataErrorState extends LayoutState {}

// for Sports list 5🎿
class LayoutGetCurrentSportsDataLoadingState extends LayoutState {}

class LayoutGetCurrentSportsDataSuccessState extends LayoutState {}

class LayoutGetCurrentSportsDataErrorState extends LayoutState {}

// for libraryData
class LayoutGetLibraryDataLoadingState extends LayoutState {}

class LayoutGetLibraryDataSuccessState extends LayoutState {}

// for downloadData
class LayoutGetDownloadDataLoadingState extends LayoutState {}

class LayoutGetDownloadDataSuccessState extends LayoutState {}

// for launchURLBrowser 🎿
class LayoutLaunchURLBrowserLoadingState extends LayoutState {}

class LayoutLaunchURLBrowserSuccessState extends LayoutState {}

class LayoutLaunchURLBrowserErrorState extends LayoutState {}

//favorite list
class LayoutGetFavoriteDataLoadingState extends LayoutState {}

class LayoutGetFavoriteDataSuccessState extends LayoutState {}
