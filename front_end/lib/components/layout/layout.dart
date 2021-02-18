import 'package:flutter/material.dart';

// Constants
import '../../utils/constants.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final bool hasBackButton;

  Layout({this.child, this.hasBackButton=false});

  @override
  Widget build(BuildContext context) {
    AppBar appBar;

    if(hasBackButton) {
      appBar = AppBar(
        automaticallyImplyLeading: true,
      );
    }

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: defaultPadding, right: defaultPadding, top: defaultPadding),
          child: this.child,
        ),
      ) 
    );
  }
}