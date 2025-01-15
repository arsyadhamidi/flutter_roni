// To parse this JSON data, do
//
//     final modelKepatuhan = modelKepatuhanFromJson(jsonString);

import 'dart:convert';

ModelKepatuhan modelKepatuhanFromJson(String str) => ModelKepatuhan.fromJson(json.decode(str));

String modelKepatuhanToJson(ModelKepatuhan data) => json.encode(data.toJson());

class ModelKepatuhan {
  bool? success;
  String? message;
  Data? data;

  ModelKepatuhan({
    this.success,
    this.message,
    this.data,
  });

  factory ModelKepatuhan.fromJson(Map<String, dynamic> json) => ModelKepatuhan(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? norec;
  int? statusenabled;
  int? userid;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.norec,
    this.statusenabled,
    this.userid,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    norec: json["norec"],
    statusenabled: json["statusenabled"],
    userid: json["userid"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "norec": norec,
    "statusenabled": statusenabled,
    "userid": userid,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
