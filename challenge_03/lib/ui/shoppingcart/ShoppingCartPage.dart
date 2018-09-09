import 'package:challenge_03/blocs/BlocProvider.dart';
import 'package:challenge_03/blocs/ShoppingCartBloc.dart';
import 'package:flutter/material.dart';

import 'package:challenge_03/core/navigation/AppNavigator.dart';
import 'package:challenge_03/data/model/cart.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  ShoppingCartState createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCartPage> {
  @override
  void initState() {
    final ShoppingCartBloc shoppingCartBloc =
        BlocProvider.of<ShoppingCartBloc>(context);
    shoppingCartBloc.inShoppingCart.add(null);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new ShoppingCartToolbar(),
      body: ListView(
        children: <Widget>[shoppingCartInfo(context), shoppingCartList()],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => AppNavigator.goToProductsList(context),
        tooltip: 'Add to cart',
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget shoppingCartInfo(BuildContext context) {
    final ShoppingCartBloc shoppingCartBloc =
        BlocProvider.of<ShoppingCartBloc>(context);

    return new SizedBox(
        height: 100.0,
        child: StreamBuilder<Cart>(
            stream: shoppingCartBloc.outShoppingCart,
            builder: (context, snapshot) {
              int totalItems =
                  snapshot.data == null ? 0 : snapshot.data.getTotalItems();
              return Center(
                  child: new Text("Total products:" + totalItems.toString()));
            }));
  }

  Widget shoppingCartList() {
    final ShoppingCartBloc shoppingCartBloc =
        BlocProvider.of<ShoppingCartBloc>(context);

    return Container(
        height: 400.0,
        child: StreamBuilder<Cart>(
            stream: shoppingCartBloc.outShoppingCart,
            initialData: Cart(new List()),
            builder: (context, snapshot) {
              Cart cart = snapshot.data;
              return ListView.builder(
                  itemCount: cart.getTotalItems(),
                  itemBuilder: (_, index) => ListTile(
                      contentPadding: EdgeInsets.only(
                          left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
                      leading: Image
                          .network(cart.getItems()[index].product.imageUrl),
                      title: Text(cart.getItems()[index].product.name),
                      subtitle:
                          Text(cart.getItems()[index].product.description),
                      trailing:
                          Text(cart.getItems()[index].getPrice().toString())));
            }));
  }
}

class ShoppingCartToolbar extends AppBar {
  ShoppingCartToolbar() : super(title: new Text("Shopping app"));
}
