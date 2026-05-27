import 'Data.dart';

class RegisterResponse {
  RegisterResponse({
      this.statusCode, 
      this.data, 
      this.message, 
      this.success,});

  RegisterResponse.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    success = json['success'];
  }
  int? statusCode;
  Data? data;
  String? message;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    map['success'] = success;
    return map;
  }

}