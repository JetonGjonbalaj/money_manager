import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:money_manager/models/error_response.dart';
import 'package:money_manager/models/unauthorized_response.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/redux/auth/actions/fetch_login_action.dart';
import 'package:money_manager/redux/auth/actions/fetch_signup_action.dart';
import 'package:money_manager/redux/auth/actions/auth_failed_action.dart';
import 'package:money_manager/redux/auth/actions/fetch_user_action.dart';
import 'package:money_manager/redux/auth/actions/login_success_action.dart';
import 'package:money_manager/redux/auth/actions/logout_action.dart';
import 'package:money_manager/redux/auth/actions/signup_success_action.dart';
import 'package:money_manager/redux/auth/actions/user_not_found_action.dart';
import 'package:money_manager/redux/balance/actions/fetch_balance_action.dart';
import 'package:money_manager/redux/balance/actions/fetch_balance_fail_action.dart';
import 'package:money_manager/redux/balance/actions/fetch_balance_success_action.dart';
import 'package:money_manager/redux/categories/actions/fetch_categories_action.dart';
import 'package:money_manager/redux/categories/actions/fetch_categories_fail_action.dart';
import 'package:money_manager/redux/categories/actions/fetch_categories_success_action.dart';
import 'package:money_manager/redux/category_expenses/actions/fetch_category_expense_action.dart';
import 'package:money_manager/redux/category_expenses/actions/fetch_category_expense_fail_action.dart';
import 'package:money_manager/redux/category_expenses/actions/fetch_category_expense_success_action.dart';
import 'package:money_manager/redux/record/actions/expense_post_action.dart';
import 'package:money_manager/redux/record/actions/income_post_action.dart';
import 'package:money_manager/redux/record/actions/record_fail_action.dart';
import 'package:money_manager/redux/record/actions/record_success_action.dart';
import 'package:money_manager/redux/upcoming_expense/actions/fetch_upcoming_expense_action.dart';
import 'package:money_manager/redux/upcoming_expense/actions/fetch_upcoming_expense_fail_action.dart';
import 'package:money_manager/redux/upcoming_expense/actions/fetch_upcoming_expense_success_action.dart';
import 'package:money_manager/screens/dashboard/dashboard_screen.dart';
import 'package:money_manager/screens/login/login_screen.dart';
import 'package:money_manager/services/auth_service.dart';
import 'package:money_manager/services/money_management_api.dart';
import 'package:redux/redux.dart';

void apiMiddleware(Store<AppState> store, action, NextDispatcher next) async {
  next(action);
  
  if (action is FetchUserAction) {
    AuthService.getUser()
      .then((value) {
        store.dispatch(
          LoginSuccessAction(
            loginResponse: value
          ));
      })
      .catchError((err) => store.dispatch(UserNotFoundAction()));
  }
  else if (action is FetchLoginAction) {
    MoneyManagementApi.logIn(action.loginRequest)
      .then((value) =>
        store.dispatch(
          LoginSuccessAction(
            loginResponse: value
          ))
      )
      .catchError((err) => authError(store, err));
  }
  else if (action is LoginSuccessAction) {
    AuthService.setUser(action.loginResponse)
      .then((value) => 
        store.dispatch(
          NavigateToAction.replace(DashboardScreen.routeName)
        )
      )
      .catchError((err) =>
        AuthService.removeUser()
      );
  }
  else if (action is FetchSignupAction) {
    MoneyManagementApi.signup(action.signupRequest)
      .then((value) => store.dispatch(
        SignupSuccessAction(
          signupResponse: value
        )
      ))
      .catchError((err) => authError(store, err));
  }
  else if (action is LogoutAction) {
    AuthService.removeUser();
    store.dispatch(
      NavigateToAction.replace(LoginScreen.routeName)
    );
  }
  else if (action is FetchBalanceAction){
    AuthService.getUser()
      .then((value) => 
        MoneyManagementApi.getBalance(value.token)
          .then((value) => 
            store.dispatch(FetchBalanceSuccessAction(amount: value))
          )
      )
      .catchError((err) => store.dispatch(FetchBalanceFailAction()));
  }
  else if (action is FetchUpcomingExpenseAction) {
    AuthService.getUser()
      .then((value) => 
        MoneyManagementApi.getUpcomingExpenses(value.token)
          .then((value) => 
            store.dispatch(FetchUpcomingExpenseSuccessAction(upcomingExpenses: value))
          )
      )
      .catchError((err) => store.dispatch(FetchUpcomingExpenseFailAction()));
  }
  else if (action is FetchCategoryExpenseAction) {
    AuthService.getUser()
      .then((value) => 
        MoneyManagementApi.getExpensesByCategory(value.token)
          .then((value) => 
            store.dispatch(FetchCategoryExpenseSuccessAction(categoryExpenses: value))
          )
      )
      .catchError((err) => store.dispatch(FetchCategoryExpenseFailAction()));
  }
  else if (action is FetchCategoriesAction) {
    MoneyManagementApi.getCategories()
      .then((value) => 
        store.dispatch(FetchCategoriesSuccessAction(categories: value))
      )
      .catchError((err) => store.dispatch(FetchCategoriesFailAction()));
  }
  else if (action is ExpensePostAction) {
    AuthService.getUser()
      .then((value) => 
        MoneyManagementApi.createExpenseForUser(value.token, action.expense)
          .then((value) => 
            store.dispatch(RecordSuccessAction(message: value.message))
          )
      )
      .catchError((ErrorResponse err) => store.dispatch(RecordFailAction(errorResponse: err)))
      .catchError((UnauthorizedResponse err) => store.dispatch(RecordFailAction(errorResponse: ErrorResponse(message: "Unauthorized"))));
  }
  else if (action is IncomePostAction) {
    AuthService.getUser()
      .then((value) => 
        MoneyManagementApi.createIncomeForUser(value.token, action.income)
          .then((value) => 
            store.dispatch(RecordSuccessAction(message: value.message))
          )
      )
      .catchError((ErrorResponse err) => store.dispatch(RecordFailAction(errorResponse: err)))
      .catchError((UnauthorizedResponse err) => store.dispatch(RecordFailAction(errorResponse: ErrorResponse(message: "Unauthorized"))));
  }

}

void authError(Store<AppState> store, dynamic err) {
  if (err is ErrorResponse) {
    store.dispatch(
      AuthFailedAction(errorResponse: err)
    );
  } else {
    store.dispatch(
      AuthFailedAction(errorResponse: ErrorResponse(message: "Error with api!", errors: null))
    );
  }
}