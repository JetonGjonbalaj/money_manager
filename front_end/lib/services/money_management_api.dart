import 'package:money_manager/models/balance.dart';
import 'package:money_manager/models/category.dart';
import 'package:money_manager/models/category_expense.dart';
import 'package:money_manager/models/error_response.dart';
import 'package:money_manager/models/expense.dart';
import 'package:money_manager/models/income.dart';
import 'package:money_manager/models/login_request.dart';
import 'package:money_manager/models/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:money_manager/models/signup_request.dart';
import 'dart:convert' as convert;

import 'package:money_manager/models/signup_response.dart';
import 'package:money_manager/models/success_response.dart';
import 'package:money_manager/models/unauthorized_response.dart';
import 'package:money_manager/models/upcoming_expense.dart';
import 'package:money_manager/utils/constants.dart';

class MoneyManagementApi {
  static final String _apiUri = "$endPointURL/api";
  static final Map<String, String> _headers = {
    "Accept": "*/*",
    "Content-Type": "application/json"
  };

  static Future<LoginResponse> logIn(LoginRequest loginRequest) async {
    var url = "$_apiUri/Authenticate/Login";
    
    var response = await http.post(
      url, 
      body: convert.jsonEncode(loginRequest.toJson()),
      headers: _headers
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return LoginResponse.fromJson(jsonResponse);
    }
    else if (response.statusCode == 400) {
      var jsonResponse = convert.jsonDecode(response.body);
      return Future.error(ErrorResponse.fromJson(jsonResponse));
    }

    return Future.error("Login Error");
  }

  static Future<SignupResponse> signup(SignupRequest signupRequest) async {
    var url = "$_apiUri/Authenticate/Register";

    var response = await http.post(
      url,
      body: convert.jsonEncode(signupRequest.toJson()),
      headers: _headers
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return SignupResponse.fromJson(jsonResponse);
    }
    else if (response.statusCode == 400) {
      var jsonResponse = convert.jsonDecode(response.body);
      return Future.error(ErrorResponse.fromJson(jsonResponse));
    }

    return Future.error("Signup Error");
  }

  static Future<Balance> getBalance(String token) async {
    var url = "$_apiUri/Record/UserBalance";
    _headers["Authorization"] = "Bearer $token";

    var response = await http.get(
      url,
      headers: _headers
    );

    if(response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return Balance.fromJson(jsonResponse);
    }
    else if (response.statusCode == 401) {
      return Future.error(UnauthorizedResponse());
    }

    return Future.error("Error retrieving balance");
  }

  static Future<UpcomingExpenses> getUpcomingExpenses(String token) async {
    var url = "$_apiUri/Record/UserUpcomingExpenses";
    _headers["Authorization"] = "Bearer $token";

    var response = await http.get(
      url,
      headers: _headers
    );

    if(response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return UpcomingExpenses.fromJson(jsonResponse);
    }
    else if (response.statusCode == 401) {
      return Future.error(UnauthorizedResponse());
    }

    return Future.error("Error retrieving upcoming expenses");
  }

  static Future<List<CategoryExpense>> getExpensesByCategory(String token) async {
    var url = "$_apiUri/Record/UserExpensesByCategory";
    _headers["Authorization"] = "Bearer $token";

    var response = await http.get(
      url,
      headers: _headers
    );

    if(response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      List<CategoryExpense> categoryExpenses = List<CategoryExpense>();
      jsonResponse.forEach((v) {
        categoryExpenses.add(CategoryExpense.fromJson(v));
      });

      return categoryExpenses;
    }
    else if (response.statusCode == 401) {
      return Future.error(UnauthorizedResponse());
    }

    return Future.error("Error retrieving expenses by category");
  }

  static Future<List<Category>> getCategories() async {
    var url = "$_apiUri/Categories";
    
    var response = await http.get(
      url,
      headers: _headers
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      List<Category> categories = List<Category>();
      jsonResponse.forEach((v) {
        categories.add(Category.fromJson(v));
      });

      return categories;
    }

    return Future.error("Error retrieving categories");
  }

  static Future<SuccessResponse> createIncomeForUser(String token, Income income) async {
    var url = "$_apiUri/Income/Create";
    var body = convert.jsonEncode(income.toJson());
    _headers["Authorization"] = "Bearer $token";

    var response = await http.post(
      url,
      headers: _headers,
      body: body
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return SuccessResponse.fromJson(jsonResponse);
    }
    else if (response.statusCode == 400) {
      var jsonResponse = convert.jsonDecode(response.body);
      return Future.error(ErrorResponse.fromJson(jsonResponse));
    }
    else if (response.statusCode == 401) {
      return Future.error(UnauthorizedResponse());
    }

    return Future.error("Error creating income");
  }

  static Future<SuccessResponse> createExpenseForUser(String token, Expense expense) async {
    var url = "$_apiUri/Expense/Create";
    var body = convert.jsonEncode(expense.toJson());
    _headers["Authorization"] = "Bearer $token";

    var response = await http.post(
      url,
      headers: _headers,
      body: body
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return SuccessResponse.fromJson(jsonResponse);
    }
    else if (response.statusCode == 400) {
      var jsonResponse = convert.jsonDecode(response.body);
      return Future.error(ErrorResponse.fromJson(jsonResponse));
    }
    else if (response.statusCode == 401) {
      return Future.error(UnauthorizedResponse());
    }

    return Future.error("Error creating expense");
  }
}