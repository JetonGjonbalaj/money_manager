import 'package:flutter/material.dart';

// Constants
import '../../utils/constants.dart';

class Layout extends StatelessWidget {
  final Widget child;

  Layout({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: defaultPadding, right: defaultPadding, top: defaultPadding),
          child: this.child,
        ),
      ) 
    );
  }
}