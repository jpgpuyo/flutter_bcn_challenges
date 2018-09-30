import 'dart:async';
import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/database/DbHelper.dart';
import 'package:challenge_03/data/products/ProductDb.dart';
import 'package:challenge_03/data/products/ProductDbMapper.dart';

class ProductsDbDataSource {
  DbHelper dbHelper;
  ProductDbMapper productDbMapper;

  ProductsDbDataSource(this.dbHelper) {
    this.dbHelper = dbHelper;
    this.productDbMapper = ProductDbMapper();
  }

  Future<List<Product>> fetchProductList() async {
    var result = await dbHelper.get("SELECT * FROM Product ORDER BY id");
    List<Product> productList = result
        .map((rowDb) => productDbMapper.fromMap(rowDb))
        .map((db) => productDbMapper.toModel(db))
        .toList();
    return Future.value(productList);
  }

  Future<bool> saveProductList(List<Product> productList) async {
    await dbHelper.insertAll(
        "Product",
        productList
            .map((model) =>
                productDbMapper.toMap(productDbMapper.fromModel(model)))
            .toList());
    return Future.value(true);
  }

  Future<bool> clearProductList() async {
    return await dbHelper.deleteAll("Product");
  }
}
