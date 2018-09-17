import 'package:challenge_03/data/repository/CartRepository.dart';
import 'package:challenge_03/data/repository/ProductsFileDataSource.dart';
import 'package:challenge_03/data/repository/ProductsRepository.dart';

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
