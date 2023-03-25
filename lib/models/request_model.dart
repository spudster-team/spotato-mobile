import 'package:flutter_latlong/flutter_latlong.dart';

import 'category_model.dart';

class RequestModel {
  String id;
  String label;
  String description;
  CategoryModel category;
  LatLng location;
  Duration duration;
  DateTime requestedStartTime;
  int amount;
  DateTime startTime;
  DateTime stopTime;

  RequestModel({
    required this.id,
    required this.label,
    required this.description,
    required this.category,
    required this.location,
    required this.duration,
    required this.requestedStartTime,
    required this.amount,
    required this.startTime,
    required this.stopTime,
  });

  factory RequestModel.fromJson(Map<String, dynamic> jsonMap) {
    return RequestModel(
      id: jsonMap['id'],
      label: jsonMap['label'],
      description: jsonMap['description'],
      category: CategoryModel.fromJson(jsonMap['categorie']),
      location: LatLng(jsonMap['latitude'], jsonMap['longitude']),
      duration: Duration(seconds: jsonMap['duration']),
      requestedStartTime: DateTime.parse(jsonMap['requested_start_time']),
      amount: jsonMap['montant'],
      startTime: DateTime.parse(jsonMap['start_time']),
      stopTime: DateTime.parse(jsonMap['stop_time']),
    );
  }
}
