import 'package:flutter/material.dart';
import 'package:money_manager/screens/login/login_screen.dart';

// Constants
import '../../utils/constants.dart';

// Components
import '../../components/layout/layout.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = '/signup';

  const SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
          Text(
            "Sign Up Page",
            textAlign: TextAlign.center,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: "Full name",
              prefixIcon: Icon(Icons.person)
            )
          ),
          SizedBox(height: spaceBetween,),
          TextField(
            decoration: const InputDecoration(
              labelText: "E-mail",
              prefixIcon: Icon(Icons.email)
            )
          ),
          SizedBox(height: spaceBetween,),
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
          SizedBox(height: spaceBetween,),
          RaisedButton(
            onPressed: () {},
            child: const Text("Sign Up"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You already have an account?"),
              FlatButton(
                onPressed: () => Navigator.popAndPushNamed(context, LoginScreen.routeName), 
                child: Text("Log in")
              )
            ],
          )
        ],
      ),
    );
  }
}