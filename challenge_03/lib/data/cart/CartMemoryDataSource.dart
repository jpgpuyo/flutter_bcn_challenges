import 'dart:async';

import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/core/model/Product.dart';

class CartMemoryDataSource {
  Cart cart = Cart(new List());

  Future<Cart> getShoppingCart() {
    return Future.value(cart);
  }

  Future<Cart> updateCart(Cart cart) {
    this.cart = cart;
    return Future.value(cart);
  }

  Future<CartItem> addProductToShoppingCart(Product product) {
    var cartItem = cart.getItems().firstWhere(
        (item) => product.id == item.product.id,
        orElse: () => CartItem(0, product));

    if (cartItem.isEmpty()) {
      cartItem.quantity = cartItem.quantity + 1;
      cart.items.add(cartItem);
      return Future.value(cartItem);
    } else {
      return updateCartItemQuantity(cartItem.quantity + 1, cartItem);
    }
  }

  Future<CartItem> updateCartItemQuantity(int quantity, CartItem cartItem) {
    var itemToUpdate = cart
        .getItems()
        .firstWhere((item) => item.product.id == cartItem.product.id);

    itemToUpdate.quantity = quantity;
    return Future.value(itemToUpdate);
  }

  void removeCartItem(CartItem cartItem) {
    cart
        .getItems()
        .removeWhere((item) => item.product.id == cartItem.product.id);
  }
}
