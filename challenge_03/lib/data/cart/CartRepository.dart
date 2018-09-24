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
  final Cart cart = Cart(new List());

  @override
  Future<Cart> getShoppingCart() {
    return Future.value(cart);
  }

  @override
  Future<Product> addProductToShoppingCart(Product product) {
    var cartItem = cart.getItems().firstWhere(
        (item) => product.id == item.product.id,
        orElse: () => CartItem(0, product));

    if (cartItem.isEmpty()) {
      cartItem.quantity = cartItem.quantity + 1;
      cart.items.add(cartItem);
    } else {
      updateCartItemQuantity(cartItem.quantity + 1, cartItem);
    }
    return Future.value(product);
  }

  @override
  Future<CartItem> updateCartItemQuantity(int quantity, CartItem cartItem) {
    var itemToUpdate = cart
        .getItems()
        .firstWhere((item) => item.product.id == cartItem.product.id);

    itemToUpdate.quantity = quantity;
    return Future.value(itemToUpdate);
  }

  @override
  Future<void> removeCartItem(CartItem cartItem) {
    cart
        .getItems()
        .removeWhere((item) => item.product.id == cartItem.product.id);
  }
}
