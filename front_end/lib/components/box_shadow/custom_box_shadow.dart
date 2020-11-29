import 'package:flutter/material.dart';

class CustomBoxShadow extends StatelessWidget {
  final Widget child;
  final double width;

  CustomBoxShadow({this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: Offset(1.0, 3.0),
            blurRadius: 10.0,
          )
        ]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: this.child
      )
    );
  }
}