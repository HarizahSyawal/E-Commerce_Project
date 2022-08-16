import 'package:ecommerce_application/services/transaction_service.dart';
import 'package:flutter/material.dart';

import '../models/cart_model.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
  ) async {
    try {
      if (await TransactionService().checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
