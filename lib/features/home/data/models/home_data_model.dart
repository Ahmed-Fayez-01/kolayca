class HomeDataModel {
  String? message;
  List<HomeData>? data;
  bool? status;
  int? statusCode;
  HomeDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <HomeData>[];
      json['data'].forEach((v) {
        data!.add(HomeData.fromJson(v));
      });
    }
    status = json['status'];
    statusCode = json['statusCode'];
  }
}

class HomeData {
  int? id;
  String? title;
  String? linkUrl;
  String? image;
  String? description;

  HomeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    linkUrl = json['link_url'];
    image = json['image'];
    description = json['description'];
  }
}
