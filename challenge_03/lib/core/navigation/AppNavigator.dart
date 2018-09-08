import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:challenge_03/ui/productslist/ProductsListPage.dart';

class AppNavigator {
  static final Router _router = new Router();

  static void init() {
    _router.define("/productsList", handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new ProductsListPage();
    }));
  }

  static void goToProductsList(context) {
    _goTo(context, "/productsList", transition: TransitionType.fadeIn);
  }

  static void back(context) {
    Navigator.pop(context);
  }

  static void _goTo(context, String route, {TransitionType transition}) {
    _router.navigateTo(context, route, transition: transition);
  }
}
