import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? name;
  final String? mobile;
  final String? email;
  final String? image;
  final String? role;

  const UserModel({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.image,
    this.role,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        id: data['id'] as int?,
        name: data['name'] as String?,
        mobile: data['mobile'] as String?,
        email: data['email'] as String?,
        image: data['image'] as String?,
        role: data['role'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'mobile': mobile,
        'email': email,
        'image': image,
        'role': role,
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
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      image: image ?? this.image,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [id, name, mobile, email, image, role];
}
