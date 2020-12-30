import 'package:flutter/material.dart';

// Constants
import '../../utils/constants.dart';

// Components
import '../../components/layout/layout.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = '/forgot_password';

  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Forgot password page"),
    );
  }
}