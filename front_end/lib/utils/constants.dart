import 'package:flutter/material.dart';

const textColor = Color.fromRGBO(0, 0, 0, 1.0);
const textLightColor = Color.fromRGBO(0, 0, 0, 0.8);

const defaultPadding = 16.0;

const spaceBetween = 20.0;

BoxDecoration boxShadow = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.16),
      offset: Offset(1.0, 3.0),
      blurRadius: 10.0,
    )
  ]
);

const endPointURL = "http://10.0.2.2:5000";
