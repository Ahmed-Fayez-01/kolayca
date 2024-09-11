import 'package:intl/intl.dart';

class NotificationModel {
  final int id;
  String? title;
  String? body;
  String? datetime;

  NotificationModel({
    required this.id,
    this.title,
    this.body,
    this.datetime,
  });

  // Factory method to create a NotificationModel from a JSON object
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      datetime: json['time'],
    );
  }

  // Method to convert a NotificationModel to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'datetime': datetime,
    };
  }

  // Method to check if the notification is valid
  bool isValid() {
    return title != null && body != null && datetime != null;
  }

  // Method to format the datetime to a more readable format
  String formattedDateTime() {
    if (datetime == null) {
      return 'No date provided';
    }
    final DateFormat backendFormat = DateFormat('HH:mm a dd MMM yyyy');
    final DateFormat displayFormat = DateFormat('yyyy-MM-dd – HH:mm');
    try {
      final DateTime parsedDateTime = backendFormat.parse(datetime!);
      return displayFormat.format(parsedDateTime);
    } catch (e) {
      return 'Invalid date format';
    }
  }

  String getShortDate() {
    if (datetime == null) {
      return '';
    }
    final DateFormat backendFormat = DateFormat('hh:mm a dd MMM yyyy', 'en_US');
    final DateFormat shortDateFormat = DateFormat('MMM d', 'en_US');
    try {
      final DateTime parsedDateTime = backendFormat.parse(datetime!);
      return shortDateFormat.format(parsedDateTime);
    } catch (e) {
      return '';
    }
  }

  // Method to update the title of the notification
  void updateTitle(String newTitle) {
    title = newTitle;
  }

  // Method to update the body of the notification
  void updateBody(String newBody) {
    body = newBody;
  }

  // Method to update the datetime of the notification
  void updateDateTime(String newDateTime) {
    datetime = newDateTime;
  }

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, body: $body, datetime: $datetime)';
  }
}
