import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/redux/theme/theme_reducer.dart';

AppState appReducer(AppState state, dynamic action) =>
  AppState(
    theme: themeReducer(state.theme, action)
  );