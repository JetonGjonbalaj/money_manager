import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:money_manager/enums/theme_style.dart';
import 'package:money_manager/redux/theme/actions/set_theme_action.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/screens/forgot_password/forgot_password_screen.dart';
import 'package:money_manager/screens/signup/signup_screen.dart';

// Constants
import '../../utils/constants.dart';

// Components
import '../../components/layout/layout.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';

  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            "Login Page",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: spaceBetween,),
          const TextField(
            decoration: InputDecoration(
              labelText: "E-mail",
              prefixIcon: Icon(Icons.email)
            )
          ),
          const SizedBox(height: spaceBetween,),
          TextField(
            decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: _toggleVisibility,
                icon: _obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility), 
              )
            ),
            obscureText: _obscureText,
          ),
          const SizedBox(height: spaceBetween,),
          FlatButton(
            onPressed: () => Navigator.popAndPushNamed(context, ForgotPasswordScreen.routeName),
            child: Text("Forgot password?")
          ),
          StoreConnector<AppState, VoidCallback>(
            converter: (store) => () {
              ThemeStyle themeStyle = store.state.theme.themeStyle == ThemeStyle.light ?
                ThemeStyle.dark :
                ThemeStyle.light;

              return store.dispatch(SetThemeAction(
                themeStyle: themeStyle
              )); 
            },
            builder: (context, callback) {
              return RaisedButton(
                onPressed: callback,
                child: const Text("Login"),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("You don't have an account?"),
              FlatButton(
                onPressed: () => Navigator.popAndPushNamed(context, SignupScreen.routeName), 
                child: Text("Sign up")
              )
            ],
          )
        ],
      ),
    );
  }
}