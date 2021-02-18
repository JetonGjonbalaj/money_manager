class SuccessResponse {
  String data;
  bool succeeded;
  String message;
  List<String> errors;

  SuccessResponse({this.data, this.succeeded, this.message, this.errors});

  SuccessResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['succeeded'] = this.succeeded;
    data['message'] = this.message;
    data['errors'] = this.errors;
    return data;
  }
}