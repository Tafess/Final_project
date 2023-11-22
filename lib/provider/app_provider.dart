import 'package:belkis_marketplace/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  //////// cart list
  List<ProductModel> _cartProductList = [];

  void addToCartproduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCartproduct(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCartProductList => _cartProductList;

  //// Favorite /////
  ///
  ///
  List<ProductModel> _favoriteProductList = [];

  void addToFavoriteproduct(ProductModel productModel) {
    _favoriteProductList.add(productModel);
    notifyListeners();
  }

  void removeFavoriteproduct(ProductModel productModel) {
    _favoriteProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getFavoriteProductList => _favoriteProductList;
}
