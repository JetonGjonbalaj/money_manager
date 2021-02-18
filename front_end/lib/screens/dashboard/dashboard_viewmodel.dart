import 'package:money_manager/redux/app_state.dart';
import 'package:redux/redux.dart';

class DashboardViewmodel {
  DashboardViewmodel();
  
  static DashboardViewmodel fromStore(Store<AppState> store) {
    return DashboardViewmodel();
  }
}