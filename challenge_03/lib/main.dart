import 'package:flutter/material.dart';
import 'products.dart';
import 'cart.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "ShoppingApp",
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int items = 0;

  void addToCart(int id) {
    cart.items.add(CartItem(1, products.firstWhere((item) => item.id == id)));
    setState(() {
      items = items + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new Toolbar(),
      body: ListView(
        children: <Widget>[
          itemsList(),
          cartView(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => addToCart(1),
        tooltip: 'Add to cart',
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget itemsList() {
    return Container(
        height: 400.0,
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) => ListTile(
                contentPadding: EdgeInsets.only(
                    left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
                leading: Image.network(products[index].imageUrl),
                title: Text(products[index].name),
                subtitle: Text(products[index].description),
                trailing: Text(products[index].price.toString()))));
  }

  cartView() {
    return new SizedBox(height: 100.0, child: Center(child: new Text("Total items:" + items.toString())));
  }
}

class Toolbar extends AppBar {
  Toolbar() : super(title: new Text("Shopping app"));
}
