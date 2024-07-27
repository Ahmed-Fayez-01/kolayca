class SliderModel {
  String? message;
  List<Data>? data;
  bool? status;
  int? statusCode;
  String? logo;

  SliderModel.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    statusCode = json['statusCode'];
  }
}

class Data {
  int? id;
  String? image;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}
