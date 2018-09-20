import 'package:challenge_03/data/cart/CartRepository.dart';
import 'package:challenge_03/data/products/ProductsFileDataSource.dart';
import 'package:challenge_03/data/products/ProductsRepository.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  static CartRepository get cartRepository => new CartRepositoryImpl();

  static ProductsRepository get productsRepository =>
      new ProductsRepositoryImpl(new ProductsFileDataSource());
}
