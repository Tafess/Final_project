import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String image;
  String id;
  String name;
  double price;
  String description;
  String status;
  bool isFavorite;
  int? quantity;

  ProductModel({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
    required this.isFavorite,
    this.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        image: json["image"],
        id: json["id"],
        name: json["name"],
        price: (json["price"] as num).toDouble(),
        //description: json["description"] == null ? null : json["description"],
        status: json["status"],
        isFavorite: false,
        description: 'description',
        quantity: json["quantity"],
      );
  Map<String, dynamic> toJson() => {
        "image": image,
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "status": status,
        "isFavorite": isFavorite,
        "quantity": quantity
      };

  @override
  ProductModel copyWith({
    int? quantity,
  }) =>
      ProductModel(
        id: id,
        name: name,
        description: description,
        image: image,
        isFavorite: isFavorite,
        quantity: quantity ?? this.quantity,
        price: price,
        status: status,
      );
}



// image: json["image"] == null ? null : json["image"],
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         price:
//             (json["price"] == null ? null : json["price"] as num)!.toDouble(),
//         description: json["description"] == null ? null : json["description"],
//         status: json["status"] == null ? null : json["status"],
//         isFavorite: false == null ? null : json["isFavorite"],