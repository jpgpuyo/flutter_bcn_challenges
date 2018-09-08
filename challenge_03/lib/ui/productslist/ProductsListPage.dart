import 'package:challenge_03/core/navigation/AppNavigator.dart';
import 'package:flutter/material.dart';
import 'package:challenge_03/data/model/products.dart';
import 'package:challenge_03/data/model/cart.dart';
import 'package:challenge_03/injection/Injector.dart';

class ProductsListPage extends StatefulWidget {
  @override
  ProductsListState createState() => ProductsListState();
}

class ProductsListState extends State<ProductsListPage> {
  int items = 0;

  void addToCart(int id) {
    Injector.cartRepository.getShoppingCart().items.add(CartItem(1, products.firstWhere((item) => item.id == id)));
    setState(() {
      items = items + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new ProductsListToolbar(), body: productsList());
  }

  Widget productsList() {
    return Container(
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) => ListTile(
                contentPadding: EdgeInsets.only(
                    left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
                leading: Image.network(products[index].imageUrl),
                title: Text(products[index].name),
                subtitle: Text(products[index].description),
                trailing: Text(products[index].price.toString()),
                onTap: () {
                  addToCart(products[index].id);
                  AppNavigator.back(context);
                })));
  }
}

class ProductsListToolbar extends AppBar {
  ProductsListToolbar() : super(title: new Text("Products List"));
}
