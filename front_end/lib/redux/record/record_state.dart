class RecordState {
  final bool loading;
  final String stateStatus;
  final String message;
  final List<String> errorList;
  
  RecordState({
    this.loading,
    this.stateStatus,
    this.message,
    this.errorList
  });

  RecordState copyWith({
    bool loading,
    String message,
    String stateStatus,
    List<String> errorList,
  }) {
    return RecordState(
      loading: loading ?? this.loading,
      message: message ?? this.message,
      stateStatus: stateStatus ?? this.stateStatus,
      errorList: errorList ?? this.errorList,
    );
  }

  factory RecordState.initial() {
    return RecordState(
      loading: false,
      message: null,
      stateStatus: null,
      errorList: null,
    );
  }
}