import 'package:money_manager/enums/theme_style.dart';
import 'package:money_manager/redux/theme/actions/change_theme_action.dart';
import 'package:money_manager/redux/theme/reducers/change_theme_reducer.dart';
import 'package:money_manager/redux/theme/theme_state.dart';
import 'package:redux/redux.dart';

Reducer<ThemeState> themeReducer = combineReducers<ThemeState>([
  new TypedReducer<ThemeState, ChangeThemeAction>(changeThemeReducer)
]);