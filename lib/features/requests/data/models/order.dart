import 'dart:convert';

import 'package:collection/collection.dart';

class OrderModel {
  final int? id;
  final int? userId;
  final String? user;
  final String? specialization;
  final String? translater;
  final String? time;
  final String? date;

  const OrderModel({
    this.id,
    this.userId,
    this.user,
    this.specialization,
    this.translater,
    this.time,
    this.date,
  });

  @override
  String toString() {
    return 'Order(id: $id, user: $user, specialization: $specialization, translater: $translater, time: $time, date: $date)';
  }

  factory OrderModel.fromMap(Map<String, dynamic> data) => OrderModel(
        id: data['id'] as int?,
        userId: data['user_id'] as int?,
        user: data['user'] as String?,
        specialization: data['specialization'] as String?,
        translater: data['translater'] as String?,
        time: data['time'] as String?,
        date: data['date'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'user': user,
        'specialization': specialization,
        'translater': translater,
        'time': time,
        'date': date,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderModel].
  factory OrderModel.fromJson(String data) {
    return OrderModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderModel] to a JSON string.
  String toJson() => json.encode(toMap());

  OrderModel copyWith({
    int? id,
    String? user,
    String? specialization,
    String? translater,
    String? time,
    String? date,
  }) {
    return OrderModel(
      id: id ?? this.id,
      user: user ?? this.user,
      specialization: specialization ?? this.specialization,
      translater: translater ?? this.translater,
      time: time ?? this.time,
      date: date ?? this.date,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! OrderModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      user.hashCode ^
      specialization.hashCode ^
      translater.hashCode ^
      time.hashCode ^
      date.hashCode;
}
