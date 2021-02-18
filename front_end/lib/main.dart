import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:money_manager/enums/theme_style.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/redux/app_store.dart';
import 'package:money_manager/redux/auth/actions/fetch_user_action.dart';
import 'package:money_manager/redux/auth/actions/logout_action.dart';
import 'package:money_manager/redux/categories/actions/fetch_categories_action.dart';
import 'package:money_manager/redux/theme/actions/fetch_theme_action.dart';
import 'package:money_manager/screens/dashboard/dashboard_screen.dart';
import 'package:money_manager/screens/expense/expense_screen.dart';
import 'package:money_manager/screens/homepage/homepage_screen.dart';
import 'package:money_manager/screens/income/income_screen.dart';
import 'package:money_manager/utils/themes.dart';
import 'screens/login/login_screen.dart';
import 'screens/signup/signup_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  final store = await createStore();
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
    return StoreConnector<AppState, AppState>(
      onInit: (store) {
        store.dispatch(FetchThemeAction());
        store.dispatch(FetchUserAction());
        store.dispatch(FetchCategoriesAction());
        var tokenExpired = store.state.authState?.loginData?.expireDate?.isBefore(DateTime.now()) ?? false;
        if (tokenExpired) store.dispatch(LogoutAction());
      },
      converter: (store) => store.state,
      builder: (context, state) { 
        // var home = state.authState.loginData == null
        //     ? LoginScreen() 
        //     : HomeScreen();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.themeState.themeStyle == ThemeStyle.light ? lightTheme : darkTheme,
          home: LoginScreen(),
          navigatorKey: NavigatorHolder.navigatorKey,
          routes: <String, WidgetBuilder> {
            DashboardScreen.routeName: (BuildContext context) => DashboardScreen(),
            HomeScreen.routeName: (BuildContext context) => HomeScreen(),
            LoginScreen.routeName: (BuildContext context) => LoginScreen(),
            SignupScreen.routeName: (BuildContext context) => SignupScreen(),
            ForgotPasswordScreen.routeName: (BuildContext context) => ForgotPasswordScreen(),
            IncomeScreen.routeName: (BuildContext context) => IncomeScreen(),
            ExpenseScreen.routeName: (BuildContext context) => ExpenseScreen(),
          },
        );
      },
    );
  }
}