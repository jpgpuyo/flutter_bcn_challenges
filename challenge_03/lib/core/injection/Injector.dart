import 'package:challenge_03/data/cart/CartMemoryDataSource.dart';
import 'package:challenge_03/data/cart/CartRepository.dart';
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
    _singleton._getIt.registerSingleton(_singleton._createCartRepository());
    _singleton._getIt.registerSingleton(_singleton._createProductsRepository());
  }

  CartRepository _createCartRepository() {
    return new CartRepositoryImpl(new CartMemoryDataSource());
  }

  ProductsRepository _createProductsRepository() {
    return new ProductsRepositoryImpl(new ProductsFileDataSource());
  }

  static CartRepository get cartRepository =>
      _singleton._getIt<CartRepository>();

  static ProductsRepository get productsRepository =>
      _singleton._getIt<ProductsRepository>();
}
