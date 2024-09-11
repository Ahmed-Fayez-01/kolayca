import 'dart:convert';

import 'package:collection/collection.dart';

class Specialization {
  final int? id;
  final String? title;

  const Specialization({this.id, this.title});

  @override
  String toString() => 'Specialization(id: $id, title: $title)';

  factory Specialization.fromMap(Map<String, dynamic> data) {
    return Specialization(
      id: data['id'] as int?,
      title: data['title'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Specialization].
  factory Specialization.fromJson(String data) {
    return Specialization.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Specialization] to a JSON string.
  String toJson() => json.encode(toMap());

  Specialization copyWith({
    int? id,
    String? title,
  }) {
    return Specialization(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Specialization) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
