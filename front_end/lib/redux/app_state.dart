import 'package:flutter/material.dart';

import 'theme/theme_state.dart';

class AppState {
  ThemeState theme;

  AppState({
    @required this.theme
  });

  factory AppState.initial() {
    return AppState(
      theme: ThemeState.initial()
    );
  }

  AppState copyWith({
    ThemeState theme
  }) {
    return AppState(
      theme: theme ?? this.theme
    );
  }
}