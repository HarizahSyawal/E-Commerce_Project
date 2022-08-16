import 'dart:convert';

import 'package:ecommerce_application/models/cart_model.dart';
import 'package:ecommerce_application/models/user_model.dart';
import 'package:ecommerce_application/pages/widgets/checkout_card.dart';
import 'package:http/http.dart' as http;

class TransactionService {
// http://localhost:SPECIFIC_PORT // port 80 by default
//  or
// http://127.0.0.1:SPECIFIC_PORT (IOS EMU)
// http://10.0.2.2:SPECIFIC_PORT (ANDROID EMU)
// For Example
// http://localhost:8000/api/users

  //localhost
  //String baseUrl = 'http://ecommerce-backend.test/api';

  //production
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
  ) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'address': 'Makassar',
      'items': carts
          .map((cart) => {
                'id': cart.product.id,
                'quantity': cart.quantity,
              })
          .toList(),
      'status': 'PENDING',
      'total_price': totalPrice,
      'shipping_price': 0,
    });

    var response = await http.post(
      Uri.parse('$url'),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Checkout Failed!');
    }
  }
}
