// To parse this JSON data, do
//
//     final modelUser = modelUserFromJson(jsonString);

import 'dart:convert';

ModelUser modelUserFromJson(String str) => ModelUser.fromJson(json.decode(str));

String modelUserToJson(ModelUser data) => json.encode(data.toJson());

class ModelUser {
  bool? success;
  User? user;
  String? token;

  ModelUser({
    this.success,
    this.user,
    this.token,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
    success: json["success"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "user": user?.toJson(),
    "token": token,
  };
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? nik;
  String? nohp;
  String? alamat;
  String? jkel;
  DateTime? tglLhr;
  String? namaKeluarga;
  DateTime? updatedAt;
  DateTime? createdAt;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.nik,
    this.nohp,
    this.alamat,
    this.jkel,
    this.tglLhr,
    this.namaKeluarga,
    this.updatedAt,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    nik: json["nik"],
    nohp: json["nohp"],
    alamat: json["alamat"],
    jkel: json["jkel"],
    tglLhr: json["tgl_lhr"] == null ? null : DateTime.parse(json["tgl_lhr"]),
    namaKeluarga: json["nama_keluarga"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "nik": nik,
    "nohp": nohp,
    "alamat": alamat,
    "jkel": jkel,
    "tgl_lhr": "${tglLhr!.year.toString().padLeft(4, '0')}-${tglLhr!.month.toString().padLeft(2, '0')}-${tglLhr!.day.toString().padLeft(2, '0')}",
    "nama_keluarga": namaKeluarga,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
  };
}
