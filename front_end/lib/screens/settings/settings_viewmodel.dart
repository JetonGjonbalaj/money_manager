import 'package:flutter/cupertino.dart';
import 'package:money_manager/enums/theme_style.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/redux/auth/actions/logout_action.dart';
import 'package:money_manager/redux/theme/actions/set_theme_action.dart';
import 'package:redux/redux.dart';

class SettingsViewmodel {
  final bool isLightTheme;
  final Function(BuildContext context) logout;
  final Function(bool value) toggleTheme;

  SettingsViewmodel({
    this.isLightTheme,
    this.logout,
    this.toggleTheme
  });

  static SettingsViewmodel fromStore(Store<AppState> store) {
    return SettingsViewmodel(
      isLightTheme: store.state.themeState.themeStyle == ThemeStyle.light,
      logout: (BuildContext context) => store.dispatch(LogoutAction()),
      toggleTheme: (bool value) => store.dispatch(SetThemeAction(themeStyle: store.state.themeState.themeStyle == ThemeStyle.dark ? ThemeStyle.light : ThemeStyle.dark))
    );
  }
}