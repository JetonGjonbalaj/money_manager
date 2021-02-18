import 'package:money_manager/redux/record/actions/record_fail_action.dart';
import 'package:money_manager/redux/record/record_state.dart';

RecordState recordFailReducer(RecordState state, RecordFailAction action) =>
  state.copyWith(
    loading: false,
    stateStatus: "",
    message: action.errorResponse.message ?? "",
    errorList: action.errorResponse.errors ?? []
  );