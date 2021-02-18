import 'package:flutter/material.dart';
import 'package:money_manager/models/category.dart';

class CategoriesState {
  final bool loading;
  final String status;
  final List<Category> categories;

  CategoriesState({
    @required this.loading,
    @required this.status,
    @required this.categories
  });

  factory CategoriesState.initial() {
    return CategoriesState(
      loading: false,
      status: "",
      categories: []
    );
  }

  CategoriesState copyWith({
    bool loading,
    String status,
    List<Category> categories
  }) {
    return CategoriesState(
      loading: loading ?? this.loading,
      status: status ?? this.status,
      categories: categories ?? this.categories
    );
  }
}