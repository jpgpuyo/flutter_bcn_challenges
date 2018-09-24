import 'dart:async';

import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/cart/CartMemoryDataSource.dart';

abstract class CartRepository {
  Future<Cart> getShoppingCart();

  Future<Product> addProductToShoppingCart(Product product);

  Future<CartItem> updateCartItemQuantity(int quantity, CartItem cartItem);

  Future<Null> removeCartItem(CartItem cartItem);
}

class CartRepositoryImpl implements CartRepository {
  final CartMemoryDataSource cartMemoryDataSource;

  CartRepositoryImpl(this.cartMemoryDataSource);

  @override
  Future<Cart> getShoppingCart() {
    return cartMemoryDataSource.getShoppingCart();
  }

  @override
  Future<Product> addProductToShoppingCart(Product product) {
    return cartMemoryDataSource.addProductToShoppingCart(product);
  }

  @override
  Future<CartItem> updateCartItemQuantity(int quantity, CartItem cartItem) {
    return cartMemoryDataSource.updateCartItemQuantity(quantity, cartItem);
  }

  @override
  Future<Null> removeCartItem(CartItem cartItem) async {
    cartMemoryDataSource.removeCartItem(cartItem);
  }
}
