import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? name;
  final String? mobile;
  final String? email;
  final String? image;
  final String? role;
  final num? numberHours;
  final num? numberMinutes;
  const UserModel({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.image,
    this.role,
    this.numberHours,
    this.numberMinutes,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        id: data['id'] as int?,
        name: data['name'] as String?,
        mobile: data['mobile'] as String?,
        email: data['email'] as String?,
        image: data['image'] as String?,
        role: data['role'] as String?,
        numberHours: data['number_hours'] as num?,
        numberMinutes: data['number_minutes'] as num?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'mobile': mobile,
        'email': email,
        'image': image,
        'role': role,
        'number_hours': numberHours,
        'number_minutes': numberMinutes,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());

  UserModel copyWith({
    int? id,
    String? name,
    String? mobile,
    String? email,
    String? image,
    String? role,
    num? numberHours,
    num? numberMinutes,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      image: image ?? this.image,
      role: role ?? this.role,
      numberHours: numberHours ?? this.numberHours,
      numberMinutes: numberMinutes ?? this.numberMinutes,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, mobile, email, image, role, numberHours, numberMinutes];
}
