import 'package:challenge_03/data/model/cart.dart';

abstract class CartRepository {
  Cart getShoppingCart();
}

class CartRepositoryImpl implements CartRepository {
  static final CartRepositoryImpl cartRepository =
      new CartRepositoryImpl._internal();

  CartRepositoryImpl._internal();

  factory CartRepositoryImpl() => cartRepository;

  final Cart cart = Cart(new List());

  @override
  Cart getShoppingCart() {
    return cart;
  }
}
