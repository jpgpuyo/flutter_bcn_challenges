import 'package:challenge_03/blocs/BlocProvider.dart';
import 'package:challenge_03/blocs/ShoppingCartBloc.dart';
import 'package:challenge_03/injection/Injector.dart';
import 'package:flutter/material.dart';

import 'package:challenge_03/core/navigation/AppNavigator.dart';
import 'package:challenge_03/ui/shoppingcart/ShoppingCartPage.dart';

void main() {
  AppNavigator.init();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "ShoppingApp",
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocProvider<ShoppingCartBloc>(
        bloc: ShoppingCartBloc(Injector.cartRepository),
        child: ShoppingCartPage(),
      ),
    );
  }
}
