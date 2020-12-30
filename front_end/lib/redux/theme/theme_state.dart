import 'package:flutter/material.dart';
import 'package:money_manager/enums/theme_style.dart';

class ThemeState {
  ThemeStyle themeStyle;

  ThemeState({
    @required this.themeStyle,
  });

  factory ThemeState.initial() {
    return ThemeState(
      themeStyle: ThemeStyle.light
    );
  }

  ThemeState copyWith({
    ThemeStyle themeStyle,
  }) {
    return ThemeState(
      themeStyle: themeStyle ?? this.themeStyle
    );
  }
}