import 'dart:async';
import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/database/DbHelper.dart';
import 'package:challenge_03/data/products/ProductDb.dart';

class ProductsDbDataSource {
  final DbHelper dbHelper;

  ProductsDbDataSource(this.dbHelper);

  Future<List<Product>> fetchProductList() async {
    List<ProductDb> productListDb = await dbHelper.getProductList();
    return productListDb.map((db) => db.toModel()).toList();
  }

  Future<bool> saveProductList(List<Product> productList) async {
    return await dbHelper.saveProductList(
        productList.map((model) => ProductDb.fromModel(model)).toList());
  }

  Future<bool> clearProductList() async {
    return await dbHelper.clearProductList();
  }
}
