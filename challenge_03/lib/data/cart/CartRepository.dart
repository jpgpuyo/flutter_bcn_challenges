import 'dart:async';

import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/cart/CartDbDataSource.dart';
import 'package:challenge_03/data/cart/CartMemoryDataSource.dart';

abstract class CartRepository {
  Future<Cart> getShoppingCart();

  Future<CartItem> addProductToShoppingCart(Product product);

  Future<CartItem> updateCartItemQuantity(int quantity, CartItem cartItem);

  Future<void> removeCartItem(CartItem cartItem);
}

class CartRepositoryImpl implements CartRepository {
  final CartMemoryDataSource cartMemoryDataSource;
  final CartDbDataSource cartDbDataSource;

  CartRepositoryImpl(this.cartMemoryDataSource, this.cartDbDataSource);

  @override
  Future<Cart> getShoppingCart() {
    return cartDbDataSource
        .getCart()
        .then((cart) => cartMemoryDataSource.updateCart(cart));
  }

  @override
  Future<CartItem> addProductToShoppingCart(Product product) async {
    CartItem cartItem =
        await cartMemoryDataSource.addProductToShoppingCart(product);
    await cartDbDataSource.updateCart(cartItem);
    return Future.value(cartItem);
  }

  @override
  Future<CartItem> updateCartItemQuantity(int quantity, CartItem cartItem) {
    return cartMemoryDataSource
        .updateCartItemQuantity(quantity, cartItem)
        .then((cartItem) => cartDbDataSource.updateCart(cartItem));
  }

  @override
  Future<void> removeCartItem(CartItem cartItem) async {
    return cartDbDataSource
        .removeFromCart(cartItem)
        .then((_) => cartMemoryDataSource.removeCartItem(cartItem));
  }
}
