import 'dart:async';

import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/core/model/Product.dart';

class CartMemoryDataSource {
  final Cart cart = Cart(new List());

  Future<Cart> getShoppingCart() {
    return Future.value(cart);
  }

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
