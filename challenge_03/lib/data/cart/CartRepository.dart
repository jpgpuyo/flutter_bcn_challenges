import 'dart:async';

import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/core/model/Product.dart';

abstract class CartRepository {
  Future<Cart> getShoppingCart();

  Future<Product> addProductToShoppingCart(Product product);
}

class CartRepositoryImpl implements CartRepository {
  static final CartRepositoryImpl cartRepository =
      new CartRepositoryImpl._internal();

  CartRepositoryImpl._internal();

  factory CartRepositoryImpl() => cartRepository;

  final Cart cart = Cart(new List());

  @override
  Future<Cart> getShoppingCart() async {
    return cart;
  }

  @override
  Future<Product> addProductToShoppingCart(Product product) async {
    await cart.items.add(CartItem(1, product));
    return product;
  }
}
