import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:money_manager/components/layout/layout.dart';
import 'package:money_manager/models/signup_request.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/screens/login/login_screen.dart';
import 'package:money_manager/screens/signup/signup_viewmodel.dart';
import 'package:money_manager/utils/constants.dart';
import 'package:redux/redux.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = '/signup';

  const SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;
  bool _obscureText2 = true;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleVisibility2() {
    setState(() {
      _obscureText2 = !_obscureText2;
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

  Widget content(SignupViewmodel vm) =>
    Layout(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Sign Up Page",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: spaceBetween,),
            messageText(vm.message),
            errorList(vm.errorList),
            loadingIndicator(vm.loading, vm.stateStatus),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                prefixIcon: Icon(Icons.person)
              )
            ),
            SizedBox(height: spaceBetween,),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "E-mail",
                prefixIcon: Icon(Icons.email)
              )
            ),
            SizedBox(height: spaceBetween,),
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
            SizedBox(height: spaceBetween,),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: _toggleVisibility2,
                  icon: _obscureText2 ? Icon(Icons.visibility_off) : Icon(Icons.visibility), 
                )
              ),
              obscureText: _obscureText2,
            ),
            SizedBox(height: spaceBetween,),
            RaisedButton(
              onPressed: !vm.loading 
                ? () {
                  vm.cleanErrors();
                  vm.signup(
                    SignupRequest(
                      username: usernameController.text,
                      email: emailController.text,
                      password: passwordController.text, 
                      confirmPassword: confirmPasswordController.text
                    ));
                }
                : null,
              child: const Text("Sign up"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("You already have an account?"),
                FlatButton(
                  onPressed: () {
                    vm.cleanErrors();
                    Navigator.popAndPushNamed(context, LoginScreen.routeName);
                  }, 
                  child: Text("Log in")
                )
              ],
            )
          ],
        ),
      ),
    );

  @override
  Widget build(BuildContext context) =>
    StoreConnector(
      converter: (Store<AppState> store) => SignupViewmodel.fromStore(store),
      builder: (context, vm) => content(vm),
    );
}