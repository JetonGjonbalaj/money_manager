class ErrorResponse {
  final String message;
  final List<String> errors;

  ErrorResponse({this.message, this.errors});

  ErrorResponse.fromJson(Map<String, dynamic> json) :
    message = json['Message'],
    errors = json['Errors']?.cast<String>();

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is ErrorResponse &&
      message == other.message &&
      errors == other.errors;

  @override
  int get hashCode =>
    message.hashCode ^
    errors.hashCode;
}