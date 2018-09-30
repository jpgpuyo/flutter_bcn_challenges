import 'dart:async';
import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/database/DbHelper.dart';
import 'package:challenge_03/data/products/ProductDbMapper.dart';

class ProductsDbDataSource {
  DbHelper dbHelper;
  ProductDbMapper productDbMapper;
  String tableName;

  ProductsDbDataSource(this.dbHelper) {
    this.dbHelper = dbHelper;
    this.productDbMapper = ProductDbMapper();
    this.tableName = DbHelper.tableProduct;
  }

  Future<List<Product>> fetchProductList() async {
    var result = await dbHelper.get("SELECT * FROM $tableName ORDER BY id");
    List<Product> productList =
        result.map((rowDb) => productDbMapper.toModel(rowDb)).toList();
    return Future.value(productList);
  }

  Future<bool> saveProductList(List<Product> productList) async {
    await dbHelper.insertAll(tableName,
        productList.map((model) => productDbMapper.toMap(model)).toList());
    return Future.value(true);
  }

  Future<bool> clearProductList() async {
    return await dbHelper.deleteAll(tableName);
  }
}
