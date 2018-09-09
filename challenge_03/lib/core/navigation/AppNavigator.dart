import 'package:challenge_03/blocs/BlocProvider.dart';
import 'package:challenge_03/blocs/ProductListBloc.dart';
import 'package:challenge_03/core/injection/Injector.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:challenge_03/ui/productlist/ProductsListPage.dart';

class AppNavigator {
  static final Router _router = new Router();

  static void init() {
    _router.define("/productList", handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return BlocProvider<ProductListBloc>(
        bloc: ProductListBloc(
            Injector.cartRepository, Injector.productsRepository),
        child: new ProductListPage(),
      );
    }));
  }

  static void goToProductsList(context) {
    _goTo(context, "/productList", transition: TransitionType.fadeIn);
  }

  static void back(context) {
    Navigator.pop(context);
  }

  static void _goTo(context, String route, {TransitionType transition}) {
    _router.navigateTo(context, route, transition: transition);
  }
}
