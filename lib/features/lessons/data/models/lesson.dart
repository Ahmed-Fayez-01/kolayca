import 'dart:convert';

import 'package:collection/collection.dart';

class Lesson {
  final int? id;
  final String? linkUrl;

  const Lesson({this.id, this.linkUrl});

  @override
  String toString() => 'Lesson(id: $id, linkUrl: $linkUrl)';

  factory Lesson.fromMap(Map<String, dynamic> data) => Lesson(
        id: data['id'] as int?,
        linkUrl: data['link_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'link_url': linkUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Lesson].
  factory Lesson.fromJson(String data) {
    return Lesson.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Lesson] to a JSON string.
  String toJson() => json.encode(toMap());

  Lesson copyWith({
    int? id,
    String? linkUrl,
  }) {
    return Lesson(
      id: id ?? this.id,
      linkUrl: linkUrl ?? this.linkUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Lesson) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ linkUrl.hashCode;
}
