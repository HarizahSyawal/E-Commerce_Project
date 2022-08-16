import 'package:ecommerce_application/models/product_model.dart';
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _wishList = [];
  List<ProductModel> get wishlist => _wishList;

  set wishlist(List<ProductModel> wishlist) {
    _wishList = wishlist;
    notifyListeners();
  }

  setProduct(ProductModel product) {
    if (!isWishlist(product)) {
      _wishList.add(product);
    } else {
      _wishList.removeWhere((element) => element.id == product.id);
    }

    notifyListeners();
  }

  isWishlist(ProductModel product) {
    if (_wishList.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
