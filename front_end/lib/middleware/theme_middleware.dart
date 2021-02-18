import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/redux/theme/actions/change_theme_action.dart';
import 'package:money_manager/redux/theme/actions/fetch_theme_action.dart';
import 'package:money_manager/redux/theme/actions/set_theme_action.dart';
import 'package:money_manager/services/theme_service.dart';
import 'package:redux/redux.dart';

void themeMiddleware(Store<AppState> store, action, NextDispatcher next) async {
  if (action is FetchThemeAction) {
    ThemeService.getTheme()
      .then((theme) => next(ChangeThemeAction(themeStyle: theme)))
      .catchError((error) => print("Something bad happened: $error"));
  }
  if (action is SetThemeAction) {
    ThemeService.setTheme(action.themeStyle)
      .then((value) => next(ChangeThemeAction(themeStyle: action.themeStyle)))
      .catchError((error) => print("Something bad happened: $error"));
  }

  next(action);
}