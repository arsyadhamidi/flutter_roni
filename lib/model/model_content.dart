// To parse this JSON data, do
//
//     final modelContent = modelContentFromJson(jsonString);

import 'dart:convert';

ModelContent modelContentFromJson(String str) => ModelContent.fromJson(json.decode(str));

String modelContentToJson(ModelContent data) => json.encode(data.toJson());

class ModelContent {
  bool? success;
  String? message;
  List<DataContent>? data;

  ModelContent({
    this.success,
    this.message,
    this.data,
  });

  factory ModelContent.fromJson(Map<String, dynamic> json) => ModelContent(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<DataContent>.from(json["data"]!.map((x) => DataContent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DataContent {
  Parent? parent;
  List<Parent>? child;

  DataContent({
    this.parent,
    this.child,
  });

  factory DataContent.fromJson(Map<String, dynamic> json) => DataContent(
    parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
    child: json["child"] == null ? [] : List<Parent>.from(json["child"]!.map((x) => Parent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "parent": parent?.toJson(),
    "child": child == null ? [] : List<dynamic>.from(child!.map((x) => x.toJson())),
  };
}

class Parent {
  int? id;
  int? statusenabled;
  int? contentparentid;
  String? description;
  int? sequence;
  dynamic createdAt;
  dynamic updatedAt;

  Parent({
    this.id,
    this.statusenabled,
    this.contentparentid,
    this.description,
    this.sequence,
    this.createdAt,
    this.updatedAt,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
    id: json["id"],
    statusenabled: json["statusenabled"],
    contentparentid: json["contentparentid"],
    description: json["description"],
    sequence: json["sequence"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "statusenabled": statusenabled,
    "contentparentid": contentparentid,
    "description": description,
    "sequence": sequence,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
