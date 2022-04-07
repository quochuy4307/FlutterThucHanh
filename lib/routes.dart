import 'package:flutter/widgets.dart';
import 'package:flutter_foodnow_app/detail/productpage.dart';
import 'package:flutter_foodnow_app/homepage/homepage.dart';
import 'package:flutter_foodnow_app/signup/signuppage.dart';
import 'package:flutter_foodnow_app/splashpage.dart';
import 'package:flutter_foodnow_app/signin/signinpage.dart';

import 'cart/cartpage.dart';

// import 'cart/cartpage.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName : (context) => SplashPage(),
  SignInPage.routeName : (context) => SignInPage(),
  SignUpPage.routeName : (context) => SignUpPage(),
  HomePage.routeName : (cotext) => HomePage(),
  ProductPage.routeName : (cotext) => ProductPage(),
  CartPage.routeName: (context) => CartPage(),
};