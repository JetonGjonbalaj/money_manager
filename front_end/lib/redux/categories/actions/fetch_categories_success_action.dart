import 'package:flutter/material.dart';
import 'package:money_manager/models/category.dart';

class FetchCategoriesSuccessAction {
  final List<Category> categories;

  FetchCategoriesSuccessAction({
    @required this.categories
  });
}