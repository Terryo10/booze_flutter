// To parse this JSON data, do
//
//     final checkoutDetailsModel = checkoutDetailsModelFromJson(jsonString);

import 'dart:convert';

CheckoutDetailsModel checkoutDetailsModelFromJson(String str) =>
    CheckoutDetailsModel.fromJson(json.decode(str));

String checkoutDetailsModelToJson(CheckoutDetailsModel data) =>
    json.encode(data.toJson());

class CheckoutDetailsModel {
  CheckoutDetailsModel({
    this.deliveryTimes,
    this.paymentMethods,
    this.extras,
    this.suburbs,
  });

  List<DeliveryTime>? deliveryTimes;
  List<PaymentMethod>? paymentMethods;
  List<Extra>? extras;
  List<Suburb>? suburbs;

  factory CheckoutDetailsModel.fromJson(Map<String, dynamic> json) =>
      CheckoutDetailsModel(
        deliveryTimes: List<DeliveryTime>.from(
            json["delivery_times"].map((x) => DeliveryTime.fromJson(x))),
        paymentMethods: List<PaymentMethod>.from(
            json["payment_methods"].map((x) => PaymentMethod.fromJson(x))),
        extras: List<Extra>.from(json["extras"].map((x) => Extra.fromJson(x))),
        suburbs:
            List<Suburb>.from(json["suburbs"].map((x) => Suburb.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "delivery_times":
            List<dynamic>.from(deliveryTimes!.map((x) => x.toJson())),
        "payment_methods":
            List<dynamic>.from(paymentMethods!.map((x) => x.toJson())),
        "extras": List<dynamic>.from(extras!.map((x) => x.toJson())),
        "suburbs": List<dynamic>.from(suburbs!.map((x) => x.toJson())),
      };
}

class DeliveryTime {
  DeliveryTime({
    this.id,
    this.title,
    this.time,
    this.type,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  int? time;
  String? type;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory DeliveryTime.fromJson(Map<String, dynamic> json) => DeliveryTime(
        id: json["id"],
        title: json["title"],
        time: json["time"],
        type: json["type"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "time": time,
        "type": type,
        "price": price,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class Extra {
  Extra({
    this.id,
    this.name,
    this.price,
    this.stock,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? price;
  int? stock;
  String? imagePath;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        stock: json["stock"],
        imagePath: json["image_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "stock": stock,
        "image_path": imagePath,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class PaymentMethod {
  PaymentMethod({
    this.id,
    this.name,
    this.widgetId,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? widgetId;
  int? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        id: json["id"],
        name: json["name"],
        widgetId: json["widget_id"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "widget_id": widgetId,
        "active": active,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class Suburb {
  Suburb({
    this.id,
    this.name,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Suburb.fromJson(Map<String, dynamic> json) => Suburb(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
