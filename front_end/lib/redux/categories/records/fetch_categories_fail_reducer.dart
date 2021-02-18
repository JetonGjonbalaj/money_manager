import 'package:money_manager/redux/categories/actions/fetch_categories_fail_action.dart';
import 'package:money_manager/redux/categories/categories_state.dart';

CategoriesState fetchCategoriesFailReducer(CategoriesState state, FetchCategoriesFailAction action) =>
  state.copyWith(
    loading: false,
    status: "Fetching categories failed"
  );