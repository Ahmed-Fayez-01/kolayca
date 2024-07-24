class AboutUsModel {
  String? message;
  Data? data;
  bool? status;
  int? statusCode;

  AboutUsModel({this.message, this.data, this.status, this.statusCode});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    statusCode = json['statusCode'];
  }
}

class Data {
  String? titleAbout;
  String? aboutUs;
  String? facebookLink;
  String? instagramLink;
  String? snapchatLink;
  String? tiktok;
  String? video;

  Data({
    this.titleAbout,
    this.aboutUs,
    this.facebookLink,
    this.instagramLink,
    this.snapchatLink,
    this.tiktok,
    this.video,
  });

  Data.fromJson(Map<String, dynamic> json) {
    titleAbout = json['title_about'];
    aboutUs = json['aboutUs'];
    facebookLink = json['facebookLink'];
    instagramLink = json['instagramLink'];
    snapchatLink = json['snapchatLink'];
    tiktok = json['tiktok'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title_about'] = this.titleAbout;
    data['aboutUs'] = this.aboutUs;
    data['facebookLink'] = this.facebookLink;
    data['instagramLink'] = this.instagramLink;
    data['snapchatLink'] = this.snapchatLink;
    data['tiktok'] = this.tiktok;
    data['video'] = this.video;
    return data;
  }
}
