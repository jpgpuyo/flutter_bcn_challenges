import 'dart:async';
import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/database/SqliteHelper.dart';
import 'package:challenge_03/data/products/ProductDbMapper.dart';

class ProductsDbDataSource {
  SqliteHelper sqliteHelper;
  ProductDbMapper productDbMapper;

  static const String TABLE_NAME = "Product";

  ProductsDbDataSource(this.sqliteHelper) {
    this.sqliteHelper = sqliteHelper;
    this.productDbMapper = ProductDbMapper();
  }

  Future<List<Product>> fetchProductList() async {
    var result =
        await sqliteHelper.get("SELECT * FROM $TABLE_NAME ORDER BY id");
    List<Product> productList =
        result.map((rowDb) => productDbMapper.toModel(rowDb)).toList();
    return Future.value(productList);
  }

  Future<bool> saveProductList(List<Product> productList) async {
    await sqliteHelper.insertAll(TABLE_NAME,
        productList.map((model) => productDbMapper.toMap(model)).toList());
    return Future.value(true);
  }

  Future<bool> clearProductList() async {
    return await sqliteHelper.deleteAll(TABLE_NAME);
  }
}
