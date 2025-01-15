import 'dart:convert';

ModelPemantauan modelPemantauanFromJson(String str) => ModelPemantauan.fromJson(json.decode(str));

String modelPemantauanToJson(ModelPemantauan data) => json.encode(data.toJson());

class ModelPemantauan {
  bool? success;
  String? message;
  List<DataPemantauan>? data;

  ModelPemantauan({
    this.success,
    this.message,
    this.data,
  });

  factory ModelPemantauan.fromJson(Map<String, dynamic> json) => ModelPemantauan(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<DataPemantauan>.from(json["data"]!.map((x) => DataPemantauan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DataPemantauan {
  Parent? parent;
  List<Child>? child;

  DataPemantauan({
    this.parent,
    this.child,
  });

  factory DataPemantauan.fromJson(Map<String, dynamic> json) => DataPemantauan(
    parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
    child: json["child"] == null ? [] : List<Child>.from(json["child"]!.map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "parent": parent?.toJson(),
    "child": child == null ? [] : List<dynamic>.from(child!.map((x) => x.toJson())),
  };
}

class Child {
  int? id;
  int? statusenabled;
  int? pemantauanparentid;
  String? description;
  int? sequence;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? norec;
  int? userid;
  int? status;

  Child({
    this.id,
    this.statusenabled,
    this.pemantauanparentid,
    this.description,
    this.sequence,
    this.createdAt,
    this.updatedAt,
    this.norec,
    this.userid,
    this.status,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    id: json["id"],
    statusenabled: json["statusenabled"],
    pemantauanparentid: json["pemantauanparentid"],
    description: json["description"],
    sequence: json["sequence"],
    createdAt: json["created_at"] != null ? DateTime.tryParse(json["created_at"]) : null,
    updatedAt: json["updated_at"] != null ? DateTime.tryParse(json["updated_at"]) : null,
    norec: json["norec"],
    userid: json["userid"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "statusenabled": statusenabled,
    "pemantauanparentid": pemantauanparentid,
    "description": description,
    "sequence": sequence,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "norec": norec,
    "userid": userid,
    "status": status,
  };
}

class Parent {
  int? id;
  int? statusenabled;
  String? description;
  int? sequence;
  DateTime? createdAt;
  DateTime? updatedAt;

  Parent({
    this.id,
    this.statusenabled,
    this.description,
    this.sequence,
    this.createdAt,
    this.updatedAt,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
    id: json["id"],
    statusenabled: json["statusenabled"],
    description: json["description"],
    sequence: json["sequence"],
    createdAt: json["created_at"] != null ? DateTime.tryParse(json["created_at"]) : null,
    updatedAt: json["updated_at"] != null ? DateTime.tryParse(json["updated_at"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "statusenabled": statusenabled,
    "description": description,
    "sequence": sequence,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
