// To parse this JSON data, do
//
//     final modelBerita = modelBeritaFromJson(jsonString);

import 'dart:convert';

ModelBerita modelBeritaFromJson(String str) => ModelBerita.fromJson(json.decode(str));

String modelBeritaToJson(ModelBerita data) => json.encode(data.toJson());

class ModelBerita {
  bool? success;
  String? message;
  List<DataBerita>? data;

  ModelBerita({
    this.success,
    this.message,
    this.data,
  });

  factory ModelBerita.fromJson(Map<String, dynamic> json) => ModelBerita(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<DataBerita>.from(json["data"]!.map((x) => DataBerita.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DataBerita {
  Parent? parent;

  DataBerita({
    this.parent,
  });

  factory DataBerita.fromJson(Map<String, dynamic> json) => DataBerita(
    parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
  );

  Map<String, dynamic> toJson() => {
    "parent": parent?.toJson(),
  };
}

class Parent {
  int? id;
  String? description;
  List<Child>? child;

  Parent({
    this.id,
    this.description,
    this.child,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
    id: json["id"],
    description: json["description"],
    child: json["child"] == null ? [] : List<Child>.from(json["child"]!.map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "child": child == null ? [] : List<dynamic>.from(child!.map((x) => x.toJson())),
  };
}

class Child {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Child({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    source: json["source"] == null ? null : Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source?.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt?.toIso8601String(),
    "content": content,
  };
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
