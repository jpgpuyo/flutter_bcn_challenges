import 'package:challenge_03/data/repository/CartRepository.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  static CartRepository get cartRepository => new CartRepositoryImpl();
}