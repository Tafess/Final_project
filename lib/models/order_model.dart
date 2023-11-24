import 'dart:convert';

import 'package:belkis_marketplace/models/product_model/product_model.dart';

class OrderModel {
  String payment;
  String status;
  List<ProductModel> products;
  double totalprice;
  String orderId;

  OrderModel({
    required this.totalprice,
    required this.orderId,
    required this.payment,
    required this.products,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> productMap = json['products'];
    return OrderModel(
      orderId: json["orderId"],
      products: productMap.map((e) => ProductModel.fromJson(e)).toList(),
      totalprice: json["totalprice"],
      status: json["status"],
      payment: json["payment"],
    );
  }
}
