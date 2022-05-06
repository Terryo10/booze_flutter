// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    this.data,
  });

  List<Datum>? data;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.image,
    this.subCategories,
  });

  int? id;
  String? name;
  String? image;
  List<SubCategory>? subCategories;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        subCategories: List<SubCategory>.from(
            json["subCategories"].map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "subCategories":
            List<dynamic>.from(subCategories!.map((x) => x.toJson())),
      };
}

class SubCategory {
  SubCategory({
    this.id,
    this.name,
    this.products,
  });

  int? id;
  String? name;
  List<Product>? products;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: json["name"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.imagePath,
    this.title,
    this.description,
    this.quantity,
    this.price,
    this.oldPrice,
    this.subcategoriesId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? imagePath;
  String? title;
  String? description;
  int? quantity;
  int? price;
  int? oldPrice;
  int? subcategoriesId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        imagePath: json["imagePath"],
        title: json["title"],
        description: json["description"],
        quantity: json["quantity"],
        price: json["price"],
        oldPrice: json["old_price"],
        subcategoriesId: json["subcategories_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagePath": imagePath,
        "title": title,
        "description": description,
        "quantity": quantity,
        "price": price,
        "old_price": oldPrice,
        "subcategories_id": subcategoriesId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
