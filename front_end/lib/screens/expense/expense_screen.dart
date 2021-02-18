import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:money_manager/components/layout/layout.dart';
import 'package:money_manager/models/category.dart';
import 'package:money_manager/models/expense.dart';
import 'package:money_manager/models/income.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/redux/categories/actions/fetch_categories_action.dart';
import 'package:money_manager/screens/expense/expense_viewmodel.dart';
import 'package:money_manager/screens/income/income_viewmodel.dart';
import 'package:money_manager/utils/constants.dart';
import 'package:redux/redux.dart';

class ExpenseScreen extends StatefulWidget {
  static String routeName = '/expense';
  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  DateTime pickedDateTime;
  List<DropdownMenuItem<Category>> _dropdownMenuItems;
  Category _selectedCategory;

  @override
  void initState() { 
    super.initState();

    pickedDateTime = DateTime.now();
  }

  Widget content(ExpenseViewmodel vm) =>
    Layout(
      hasBackButton: true,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              "Create Expense Page",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: spaceBetween,),
            messageText(vm.message),
            errorList(vm.errorList),
            loadingIndicator(vm.loading, vm.stateStatus),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Amount",
                prefixIcon: Icon(Icons.attach_money)
              )
            ),
            const SizedBox(height: spaceBetween,),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: "Description",
                prefixIcon: Icon(Icons.text_fields),
              ),
            ),
            const SizedBox(height: spaceBetween,),
            dropdownMenu(vm),
            const SizedBox(height: spaceBetween,),
            ListTile(
              title: Text("Date ${pickedDateTime.year}-${pickedDateTime.month}-${pickedDateTime.day} ${pickedDateTime.hour}-${pickedDateTime.minute}"),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickDate,
            ),
            const SizedBox(height: spaceBetween,),
            RaisedButton(
              onPressed: !vm.loading 
                ? () {
                  Expense expense = Expense(
                    amount: double.parse(amountController.text),
                    description: descriptionController.text,
                    categoryId: _selectedCategory.id,
                    expendedAt: pickedDateTime
                  );

                  vm.addExpense(expense);
                }
                : null,
              child: const Text("Create Expense"),
            ),
          ],
        ),
      )
    );

  Widget messageText(String message) =>
    message != null && message.isNotEmpty
      ? Text(message)
      : SizedBox();

  Widget errorList(List<String> errorList) =>
    errorList != null && errorList.length != 0
      ? ListView.builder(
        shrinkWrap: true,
        itemCount: errorList.length,
        itemBuilder: (BuildContext context, int index){
          return Text(errorList[index]);
        },
      )
      : SizedBox();

  Widget loadingIndicator(bool loading, String status) =>
    loading
      ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(status)
        ],
      )
      : SizedBox();

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      onInit: (Store<AppState> store) {
        // store.dispatch(FetchCategoriesAction());
      },
      converter: (Store<AppState> store) {
        _dropdownMenuItems = List<DropdownMenuItem<Category>>();
        if(store.state.categoriesState.categories.isNotEmpty) {
          for (Category category in store.state.categoriesState.categories) {
            _dropdownMenuItems.add(DropdownMenuItem(
              value: category, 
              child: Text(category.name)
            ));
          }
          _selectedCategory = _selectedCategory ?? _dropdownMenuItems.first.value;
        }
        
        return ExpenseViewmodel.fromStore(store);
      },
      builder: (context, vm) => content(vm),
    );
  }

  void _pickDate() {
    DateTime dateTime = DateTime(pickedDateTime.year, pickedDateTime.month, pickedDateTime.day);
    TimeOfDay timeOfDay = TimeOfDay(hour: pickedDateTime.hour, minute: pickedDateTime.minute);
    showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
      initialDate: pickedDateTime,
    )
    .then((value) {
      if(value != null) {
        dateTime = value;
      }
      showTimePicker(
        context: context, 
        initialTime: timeOfDay
      )
      .then((value) {
        if (value != null) {
          timeOfDay = value;
          setState(() {
            pickedDateTime = DateTime(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            timeOfDay.hour,
            timeOfDay.minute
          );
          });
        }
      });
    });
  }

  void onChangeDropdownItem(Category value) {
    setState(() {
      _selectedCategory = value;
    });
  }

  dropdownMenu(ExpenseViewmodel vm) =>
    vm.categoriesLoading
      ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(vm.categoriesStatus, style: Theme.of(context).textTheme.subtitle1,)
        ],
      )
      : vm.categories != null && vm.categories.length >= 1
        ? DropdownButton(
          value: _selectedCategory,
          items: _dropdownMenuItems, 
          onChanged: onChangeDropdownItem
        )
        : Text("No categories found");
}