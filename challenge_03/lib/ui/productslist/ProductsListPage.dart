import 'package:challenge_03/core/navigation/AppNavigator.dart';
import 'package:flutter/material.dart';
import 'package:challenge_03/data/model/product.dart';
import 'ProductListPresenter.dart';

class ProductListPage extends StatefulWidget {
  @override
  ProductsListState createState() => ProductsListState();
}

class ProductsListState extends State<ProductListPage>
    implements ProductListView {
  List<Product> productList = new List();

  ProductListPresenter presenter;

  ProductsListState() {
    this.presenter = new ProductListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    presenter.init();
    presenter.getProductList();
  }

  void addToCart(int id) {
    presenter.addProductToCart(productList.firstWhere((item) => item.id == id));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new ProductsListToolbar(), body: productsList());
  }

  Widget productsList() {
    return Container(
        child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (_, index) => ListTile(
                contentPadding: EdgeInsets.only(
                    left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
                leading: Image.network(productList[index].imageUrl),
                title: Text(productList[index].name),
                subtitle: Text(productList[index].description),
                trailing: Text(productList[index].price.toString()),
                onTap: () {
                  addToCart(productList[index].id);
                })));
  }

  @override
  void renderProductsList(List<Product> productList) {
    setState(() {
      this.productList = productList;
    });
  }

  @override
  void productAdded(Product product) {
    AppNavigator.back(context);
  }

  @override
  void dispose() {
    super.dispose();
    presenter.dispose();
  }
}

class ProductsListToolbar extends AppBar {
  ProductsListToolbar() : super(title: new Text("Products List"));
}
