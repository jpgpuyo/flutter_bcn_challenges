import 'package:challenge_03/blocs/BlocProvider.dart';
import 'package:challenge_03/blocs/ProductListBloc.dart';
import 'package:challenge_03/core/navigation/AppNavigator.dart';
import 'package:flutter/material.dart';
import 'package:challenge_03/data/model/products.dart';

class ProductListPage extends StatefulWidget {
  @override
  ProductsListState createState() => ProductsListState();
}

class ProductsListState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();
    final ProductListBloc productListBloc =
        BlocProvider.of<ProductListBloc>(context);
    productListBloc.inProductList.add(null);
    productListBloc.outAddProduct.listen((productAdded) {
      AppNavigator.back(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProductListBloc productListBloc =
        BlocProvider.of<ProductListBloc>(context);
    return new Scaffold(
        appBar: new ProductsListToolbar(), body: productList(productListBloc));
  }

  Widget productList(ProductListBloc productListBloc) {
    return Container(
        child: StreamBuilder(
            stream: productListBloc.outProductList,
            initialData: new List<Product>(),
            builder: (context, snapshot) {
              List<Product> productList = snapshot.data;
              return ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (_, index) => ListTile(
                      contentPadding: EdgeInsets.only(
                          left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
                      leading: Image.network(productList[index].imageUrl),
                      title: Text(productList[index].name),
                      subtitle: Text(productList[index].description),
                      trailing: Text(productList[index].price.toString()),
                      onTap: () {
                        productListBloc.inAddProduct.add(productList[index].id);
                      }));
            }));
  }
}

class ProductsListToolbar extends AppBar {
  ProductsListToolbar() : super(title: new Text("Products List"));
}
