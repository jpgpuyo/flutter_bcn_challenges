import 'package:flutter/material.dart';

import 'AppNavigator.dart';
import 'products.dart';
import 'cart.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  ShoppingCartState createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new ShoppingCartToolbar(),
      body: ListView(
        children: <Widget>[shoppingCartInfo(), shoppingCartList()],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => AppNavigator.goToProductsList(context),
        tooltip: 'Add to cart',
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget shoppingCartInfo() {
    return new SizedBox(
        height: 100.0,
        child: Center(
            child: new Text("Total products:" + cart.getTotalItems().toString())));
  }

  Widget shoppingCartList() {
    return Container(
        height: 400.0,
        child: ListView.builder(
            itemCount: cart.getTotalItems(),
            itemBuilder: (_, index) => ListTile(
                contentPadding: EdgeInsets.only(
                    left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
                leading: Image.network(products[index].imageUrl),
                title: Text(cart.getItems()[index].product.name),
                subtitle: Text(cart.getItems()[index].product.description),
                trailing: Text(cart.getItems()[index].getPrice().toString()))));
  }
}

class ShoppingCartToolbar extends AppBar {
  ShoppingCartToolbar() : super(title: new Text("Shopping app"));
}
