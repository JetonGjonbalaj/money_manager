import 'package:money_manager/redux/theme/actions/change_theme_action.dart';
import 'package:money_manager/redux/theme/theme_state.dart';

ThemeState changeThemeReducer(ThemeState state, ChangeThemeAction action) =>
  state.copyWith(
    themeStyle: action.themeStyle
  );