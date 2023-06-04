import 'dart:convert';

Categories userFromJson(String str) => Categories.fromJson(json.decode(str));
String userToJson(Categories data) => json.encode(data.toJson());

class Categories{
  String category_name;
  String description;

  Categories({
    required this.category_name,
    required this.description,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    category_name: json["category_name"],
    description: json["description"],

  );


  Map<String, dynamic> toJson() => {
    "category_name": category_name,
    "description": description,

  };


}