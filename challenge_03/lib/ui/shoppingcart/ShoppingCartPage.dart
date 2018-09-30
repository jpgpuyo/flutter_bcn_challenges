import 'package:challenge_03/ui/shoppingcart/ShoppingCartPresenter.dart';
import 'package:flutter/material.dart';

import 'package:challenge_03/core/navigation/AppNavigator.dart';
import 'package:challenge_03/core/model/Cart.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  ShoppingCartState createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCartPage>
    implements ShoppingCartView {
  ShoppingCartPresenter presenter;

  Cart cart = new Cart(new List());

  ShoppingCartState() {
    presenter = new ShoppingCartPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    presenter.init();
    presenter.getShoppingCart();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new ShoppingCartToolbar(),
      body: ListView(
        children: <Widget>[shoppingCartInfo(), shoppingCartList()],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => AppNavigator.goToProductList(context),
        tooltip: 'Add to cart',
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget shoppingCartInfo() {
    return new SizedBox(
        height: 100.0,
        child: Center(
            child:
                new Text("Total products:" + cart.getTotalItems().toString())));
  }

  Widget shoppingCartList() {
    return Container(
        height: 400.0,
        child: ListView.builder(
            itemCount: cart.getTotalItems(),
            itemBuilder: (_, index) => shoppingCartItem(index)));
  }

  Widget shoppingCartItem(int index) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.network(cart.getItems()[index].product.imageUrl),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(cart.getItems()[index].product.name),
              Text(cart.getItems()[index].product.description),
              Text(cart.getItems()[index].getPrice().toString())
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    presenter.addCartItem(cart.getItems()[index]);
                  }),
              IconButton(
                  icon: Icon(Icons.remove_shopping_cart),
                  onPressed: () {
                    presenter.removeCartItem(cart.getItems()[index]);
                  }),
            ],
          ),
          Text(
            "x" + cart.getItems()[index].quantity.toString(),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  @override
  renderCart(Cart cart) {
    setState(() {
      this.cart = cart;
    });
  }

  @override
  void dispose() {
    super.dispose();
    presenter.dispose();
  }

  @override
  void cartUpdated() {
    presenter.getShoppingCart();
  }
}

class ShoppingCartToolbar extends AppBar {
  ShoppingCartToolbar() : super(title: new Text("Shopping app"));
}
