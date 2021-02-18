import 'package:money_manager/redux/categories/actions/fetch_categories_action.dart';
import 'package:money_manager/redux/categories/actions/fetch_categories_fail_action.dart';
import 'package:money_manager/redux/categories/actions/fetch_categories_success_action.dart';
import 'package:money_manager/redux/categories/categories_state.dart';
import 'package:money_manager/redux/categories/records/fetch_categories_fail_reducer.dart';
import 'package:money_manager/redux/categories/records/fetch_categories_reducer.dart';
import 'package:money_manager/redux/categories/records/fetch_categories_success_reducer.dart';
import 'package:redux/redux.dart';

Reducer<CategoriesState> categoryStateReducer = combineReducers<CategoriesState>([
  new TypedReducer<CategoriesState, FetchCategoriesAction>(fetchCategoriesReducer),
  new TypedReducer<CategoriesState, FetchCategoriesFailAction>(fetchCategoriesFailReducer),
  new TypedReducer<CategoriesState, FetchCategoriesSuccessAction>(fetchCategoriesSuccessReducer)
]);