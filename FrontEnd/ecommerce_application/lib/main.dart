import 'package:ecommerce_application/pages/checkout_page.dart';
import 'package:ecommerce_application/pages/checkout_success_page.dart';
import 'package:ecommerce_application/pages/home/edit_profile_page.dart';
import 'package:ecommerce_application/pages/home/main_page.dart';
import 'package:ecommerce_application/providers/auth_provider.dart';
import 'package:ecommerce_application/providers/cart_provider.dart';
import 'package:ecommerce_application/providers/page_provider.dart';
import 'package:ecommerce_application/providers/product_provider.dart';
import 'package:ecommerce_application/providers/transaction_provider.dart';
import 'package:ecommerce_application/providers/wishlist_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'pages/home/cart_page.dart';
import 'pages/home/home_page.dart';
import 'pages/home/profile_page.dart';
import 'pages/home/wishlist_page.dart';
import 'pages/sign_in_page.dart';
import 'pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
        ChangeNotifierProvider(create: (context) => PageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/main': (context) => MainPage(),
          '/profile': (context) => ProfilePage(),
          '/wishlist': (context) => WishlistPage(),
          '/home': (context) => HomePage(),
          '/cart': (context) => CartPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/checkout': ((context) => CheckoutPage()),
          '/checkout-success': ((context) => CheckoutSuccessPage()),
        },
      ),
    );
  }
}
