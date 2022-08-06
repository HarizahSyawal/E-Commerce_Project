import 'package:ecommerce_application/pages/home/cart_page.dart';
import 'package:ecommerce_application/pages/detail_chat_page.dart';
import 'package:ecommerce_application/pages/home/main_page.dart';

import 'pages/home/chat_page.dart';
import 'pages/home/home_page.dart';
import 'pages/home/profile_page.dart';
import 'pages/home/wishlist_page.dart';
import 'pages/sign_in_page.dart';
import 'pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/main': (context) => MainPage(),
        '/profile': (context) => ProfilePage(),
        '/wishlist': (context) => WishlistPage(),
        '/detail-chat': (context) => DetailChatPage(),
        '/home': (context) => HomePage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
