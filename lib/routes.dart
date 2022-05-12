import 'package:flutter/widgets.dart';
import 'package:flutter_foodnow_app/detail/productpage.dart';
import 'package:flutter_foodnow_app/homepage/components/fragment/notification_fragment.dart';
import 'package:flutter_foodnow_app/homepage/homepage.dart';
import 'package:flutter_foodnow_app/search/search_page.dart';
import 'package:flutter_foodnow_app/signup/signuppage.dart';
import 'package:flutter_foodnow_app/splashpage.dart';
import 'package:flutter_foodnow_app/signin/signinpage.dart';
import 'package:flutter_foodnow_app/category/categorypage.dart';

import 'cart/cartpage.dart';

// import 'cart/cartpage.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName : (context) => SplashPage(),
  SignInPage.routeName : (context) => SignInPage(),
  SignUpPage.routeName : (context) => SignUpPage(),
  HomePage.routeName : (cotext) => HomePage(),
  ProductPage.routeName : (cotext) => ProductPage(),
  CartPage.routeName: (context) => CartPage(),
  CategoryPage.routeName : (context) => CategoryPage(),
  NotificationDetail.routeName : (context) => NotificationDetail(),
  FilterLocalListPage.routeName : (context) => FilterLocalListPage(),
};