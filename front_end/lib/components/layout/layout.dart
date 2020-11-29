import 'package:flutter/material.dart';

// Constants
import '../../constants.dart';

class Layout extends StatelessWidget {
  final Widget child;

  Layout({this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: defaultPadding, right: defaultPadding),
        child: this.child,
      ),
    );
  }
}