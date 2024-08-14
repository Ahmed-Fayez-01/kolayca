import '../../../profile/data/models/user_model.dart';

class AuthDataModel {
  String? message;
  UserModel? data;
  bool? status;
  String? accessToken;
  String? tokenType;
  int? statusCode;

  AuthDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
    status = json['status'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    statusCode = json['statusCode'];
  }
}

class Data {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? image;
  String? role;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    image = json['image'];
    role = json['role'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['image'] = image;
    data['role'] = role;
    return data;
  }
}
