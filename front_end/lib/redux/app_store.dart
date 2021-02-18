import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:money_manager/middleware/api_middleware.dart';
import 'package:money_manager/middleware/theme_middleware.dart';
import 'package:money_manager/redux/app_reducer.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:redux/redux.dart';

Future<Store<AppState>> createStore() async {
  return Store(
    storeReducer,
    initialState: AppState.initial(),
    middleware: [
      themeMiddleware,
      apiMiddleware,
      NavigationMiddleware<AppState>(),
    ],
  );
}