import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:challenge_03/ui/productlist/ProductListPage.dart';

class AppNavigator {
  static final Router _router = new Router();

  static void init() {
    _router.define("/productList", handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new ProductListPage();
    }));
  }

  static void goToProductList(context) {
    _goTo(context, "/productList", transition: TransitionType.fadeIn);
  }

  static void back(context) {
    Navigator.pop(context);
  }

  static void _goTo(context, String route, {TransitionType transition}) {
    _router.navigateTo(context, route, transition: transition);
  }
}
