import 'dart:async';

import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/core/model/Product.dart';

abstract class CartRepository {
  Future<Cart> getShoppingCart();

  Future<Product> addProductToShoppingCart(Product product);

  Future<CartItem> updateCartItemQuantity(int quantity, CartItem cartItem);

  Future<void> removeCartItem(CartItem cartItem);
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

  @override
  Future<CartItem> updateCartItemQuantity(
      int quantity, CartItem cartItem) async {
    var itemToUpdate = await cart
        .getItems()
        .firstWhere((item) => item.product.id == cartItem.product.id);

    itemToUpdate.quantity = quantity;
    return itemToUpdate;
  }

  @override
  Future<void> removeCartItem(CartItem cartItem) async {
    await cart
        .getItems()
        .removeWhere((item) => item.product.id == cartItem.product.id);
  }
}
