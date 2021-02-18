import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:money_manager/models/login_request.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/screens/homepage/homepage_screen.dart';
import 'package:money_manager/screens/login/login_viewmodel.dart';
import 'package:money_manager/screens/signup/signup_screen.dart';
import 'package:redux/redux.dart';

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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget loadingIndicator(bool loading, String status) =>
    loading
      ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(status)
        ],
      )
      : SizedBox();

  Widget messageText(String message) =>
    message != null && message.isNotEmpty
      ? Text(message)
      : SizedBox();

  Widget errorList(List<String> errorList) =>
    errorList != null && errorList.length != 0
      ? ListView.builder(
        shrinkWrap: true,
        itemCount: errorList.length,
        itemBuilder: (BuildContext context, int index){
          return Text(errorList[index]);
        },
      )
      : SizedBox();

  Widget content(LoginViewmodel vm) =>
    Layout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            "Login Page",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: spaceBetween,),
          messageText(vm.message),
          errorList(vm.errorList),
          loadingIndicator(vm.loading, vm.stateStatus),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "E-mail",
              prefixIcon: Icon(Icons.email)
            )
          ),
          const SizedBox(height: spaceBetween,),
          TextField(
            controller: passwordController,
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
          // FlatButton(
          //   onPressed: !vm.loading 
          //     ? () => Navigator.popAndPushNamed(context, ForgotPasswordScreen.routeName)
          //     : null,
          //   child: Text("Forgot password?")
          // ),
          RaisedButton(
            onPressed: !vm.loading 
              ? () {
                vm.cleanErrors();
                vm.login(
                  LoginRequest(
                    email: emailController.text,
                    password: passwordController.text
                  )
                );
              }
              : null,
            child: const Text("Login"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("You don't have an account?"),
              FlatButton(
                onPressed: !vm.loading
                  ? () {
                    vm.cleanErrors();
                    Navigator.popAndPushNamed(context, SignupScreen.routeName);
                  }
                  : null,
                child: Text("Sign up")
              )
            ],
          )
        ],
      )
    );

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => LoginViewmodel.fromStore(store),
      builder: (context, vm) => content(vm),
    );
  }
}