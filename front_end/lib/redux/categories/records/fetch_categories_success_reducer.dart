import 'package:money_manager/redux/categories/actions/fetch_categories_success_action.dart';
import 'package:money_manager/redux/categories/categories_state.dart';

CategoriesState fetchCategoriesSuccessReducer(CategoriesState state, FetchCategoriesSuccessAction action) =>
  state.copyWith(
    loading: false,
    status: "",
    categories: action.categories
  );