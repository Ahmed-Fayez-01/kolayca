import 'dart:convert';

import 'package:equatable/equatable.dart';

class PackageModel extends Equatable {
  final int? id;
  final String? name;
  final dynamic linkUrl;
  final String? description;
  final String? price;

  const PackageModel({
    this.id,
    this.name,
    this.linkUrl,
    this.description,
    this.price,
  });

  factory PackageModel.fromMap(Map<String, dynamic> data) => PackageModel(
        id: data['id'] as int?,
        name: data['name'] as String?,
        linkUrl: data['link_url'] as dynamic,
        description: data['description'] as String?,
        price: data['price'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'link_url': linkUrl,
        'description': description,
        'price': price,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PackageModel].
  factory PackageModel.fromJson(String data) {
    return PackageModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PackageModel] to a JSON string.
  String toJson() => json.encode(toMap());

  PackageModel copyWith({
    int? id,
    String? name,
    dynamic linkUrl,
    String? description,
    String? price,
  }) {
    return PackageModel(
      id: id ?? this.id,
      name: name ?? this.name,
      linkUrl: linkUrl ?? this.linkUrl,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  @override
  List<Object?> get props => [id, name, linkUrl, description, price];
}
