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
    Injector()._getIt.registerSingleton(new CartRepositoryImpl());
    Injector()._getIt.registerSingleton(
        new ProductsRepositoryImpl(new ProductsFileDataSource()));
  }

  static CartRepository get cartRepository =>
      Injector()._getIt<CartRepositoryImpl>();

  static ProductsRepository get productsRepository =>
      Injector()._getIt<ProductsRepositoryImpl>();
}
