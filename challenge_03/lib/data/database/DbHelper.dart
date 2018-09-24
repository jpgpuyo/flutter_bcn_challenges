import 'dart:async';
import 'dart:io';
import 'package:challenge_03/data/products/ProductDb.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  final String databaseName = "shoppingapp.db";
  final String tableProduct = "Product";

  Database _db;

  Database get db => _db;

  Future init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);
    _db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    print("onCreate database");
    await db.execute("CREATE TABLE Product" +
        "(" +
        "id INTEGER PRIMARY KEY," +
        "name TEXT," +
        "description TEXT," +
        "imageUrl TEXT," +
        "price REAL" +
        ")");
  }

  Future<List<ProductDb>> getProductList() async {
    var result = await _db.rawQuery("SELECT * FROM $tableProduct ORDER BY id");
    if (result.length == 0) {
      return [];
    } else {
      return result.map((rowDb) => ProductDb.fromMap(rowDb)).toList();
    }
  }

  Future<bool> saveProductList(List<ProductDb> productList) async {
    await db.transaction((txn) async {
      for (var productDb in productList) {
        await txn.insert(tableProduct, productDb.toMap());
      }
    });
    return Future.value(true);
  }

  Future<bool> clearProductList() async {
    await db.delete(tableProduct);
    return Future.value(true);
  }
}
