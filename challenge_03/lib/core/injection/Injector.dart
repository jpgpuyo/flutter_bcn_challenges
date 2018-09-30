import 'package:challenge_03/data/cart/CartDbDataSource.dart';
import 'package:challenge_03/data/cart/CartMemoryDataSource.dart';
import 'package:challenge_03/data/cart/CartRepository.dart';
import 'package:challenge_03/data/database/SqliteHelper.dart';
import 'package:challenge_03/data/products/ProductsDbDataSource.dart';
import 'package:challenge_03/data/products/ProductsFileDataSource.dart';
import 'package:challenge_03/data/products/ProductsRepository.dart';
import 'package:get_it/get_it.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();
  GetIt _getIt;

  factory Injector() {
    return _singleton;
  }

  Injector._internal() {
    _getIt = new GetIt();
  }

  static init() {
    _singleton._getIt.registerSingleton(_singleton._createSqliteHelper());
    _singleton._getIt.registerSingleton(_singleton._createCartRepository());
    _singleton._getIt.registerSingleton(_singleton._createProductsRepository());
  }

  CartRepository _createCartRepository() {
    return new CartRepositoryImpl(
        new CartMemoryDataSource(), new CartDbDataSource(dbHelper));
  }

  ProductsRepository _createProductsRepository() {
    return new ProductsRepositoryImpl(
        new ProductsFileDataSource(), new ProductsDbDataSource(dbHelper));
  }

  SqliteHelper _createSqliteHelper() {
    return SqliteHelper();
  }

  static SqliteHelper get dbHelper => _singleton._getIt<SqliteHelper>();

  static CartRepository get cartRepository =>
      _singleton._getIt<CartRepository>();

  static ProductsRepository get productsRepository =>
      _singleton._getIt<ProductsRepository>();
}
