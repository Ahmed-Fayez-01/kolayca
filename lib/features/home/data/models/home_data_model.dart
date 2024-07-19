class HomeDataModel {
  String? message;
  List<Data>? data;
  bool? status;
  int? statusCode;

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    statusCode = json['statusCode'];
  }
}

class Data {
  int? id;
  String? title;
  String? linkUrl;
  String? image;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    linkUrl = json['link_url'];
    image = json['image'];
  }
}
