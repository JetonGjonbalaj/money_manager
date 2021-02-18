
import 'package:money_manager/redux/record/actions/record_success_action.dart';
import 'package:money_manager/redux/record/record_state.dart';

RecordState recordSuccessReducer(RecordState state, RecordSuccessAction action) =>
  state.copyWith(
    loading: false,
    stateStatus: "",
    message: action.message,
    errorList: []
  );