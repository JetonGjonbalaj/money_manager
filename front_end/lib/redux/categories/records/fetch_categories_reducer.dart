import 'package:money_manager/redux/categories/actions/fetch_categories_action.dart';
import 'package:money_manager/redux/categories/categories_state.dart';

CategoriesState fetchCategoriesReducer(CategoriesState state, FetchCategoriesAction action) =>
  state.copyWith(
    loading: true,
    status: "Fetching categories"
  );