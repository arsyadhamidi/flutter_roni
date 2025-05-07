// To parse this JSON data, do
//
//     final modelHistory = modelHistoryFromJson(jsonString);

import 'dart:convert';

ModelHistory modelHistoryFromJson(String str) => ModelHistory.fromJson(json.decode(str));

String modelHistoryToJson(ModelHistory data) => json.encode(data.toJson());

class ModelHistory {
  bool? success;
  String? message;
  List<HistoryData>? data;

  ModelHistory({
    this.success,
    this.message,
    this.data,
  });

  factory ModelHistory.fromJson(Map<String, dynamic> json) => ModelHistory(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<HistoryData>.from(json["data"]!.map((x) => HistoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class HistoryData {
  int? id;
  int? userId;
  String? url;
  String? ipAddress;
  String? method;
  String? userAgent;
  DateTime? createdAt;
  DateTime? updatedAt;

  HistoryData({
    this.id,
    this.userId,
    this.url,
    this.ipAddress,
    this.method,
    this.userAgent,
    this.createdAt,
    this.updatedAt,
  });

  factory HistoryData.fromJson(Map<String, dynamic> json) => HistoryData(
    id: json["id"],
    userId: json["user_id"],
    url: json["url"],
    ipAddress: json["ip_address"],
    method: json["method"],
    userAgent: json["user_agent"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "url": url,
    "ip_address": ipAddress,
    "method": method,
    "user_agent": userAgent,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}