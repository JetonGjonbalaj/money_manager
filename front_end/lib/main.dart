import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:money_manager/enums/theme_style.dart';
import 'package:money_manager/redux/app_reducer.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/redux/theme/actions/fetch_theme_action.dart';
import 'package:money_manager/redux/theme/middleware/theme_middleware.dart';
import 'package:money_manager/utils/themes.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'screens/login/login_screen.dart';
import 'screens/signup/signup_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final store = Store<AppState>(appReducer, initialState: AppState.initial(), middleware: [themeMiddleware]);
  store.dispatch(FetchThemeAction());
  runApp(
    StoreProvider(
      store: store,
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ThemeStyle>(
      converter: (store) => store.state.theme.themeStyle,
      builder: (context, theme) { 
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme == ThemeStyle.light ? lightTheme : darkTheme,
          home: LoginScreen(),
          routes: <String, WidgetBuilder> {
            LoginScreen.routeName: (BuildContext context) => LoginScreen(),
            SignupScreen.routeName: (BuildContext context) => SignupScreen(),
            ForgotPasswordScreen.routeName: (BuildContext context) => ForgotPasswordScreen()
          },
        );
      },
    );
  }
}