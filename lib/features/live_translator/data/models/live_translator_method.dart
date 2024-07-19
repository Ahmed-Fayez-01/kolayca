import 'dart:convert';

import 'package:collection/collection.dart';

class LiveTranslatorMethod {
  int? id;
  String? title;
  String? linkUrl;

  LiveTranslatorMethod({this.id, this.title, this.linkUrl});

  @override
  String toString() {
    return 'LiveTranslatorMethod(id: $id, title: $title, linkUrl: $linkUrl)';
  }

  factory LiveTranslatorMethod.fromMap(Map<String, dynamic> data) {
    return LiveTranslatorMethod(
      id: data['id'] as int?,
      title: data['title'] as String?,
      linkUrl: data['link_url'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'link_url': linkUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LiveTranslatorMethod].
  factory LiveTranslatorMethod.fromJson(String data) {
    return LiveTranslatorMethod.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LiveTranslatorMethod] to a JSON string.
  String toJson() => json.encode(toMap());

  LiveTranslatorMethod copyWith({
    int? id,
    String? title,
    String? linkUrl,
  }) {
    return LiveTranslatorMethod(
      id: id ?? this.id,
      title: title ?? this.title,
      linkUrl: linkUrl ?? this.linkUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LiveTranslatorMethod) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ linkUrl.hashCode;
}
