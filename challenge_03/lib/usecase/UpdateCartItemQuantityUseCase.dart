import 'dart:async';

import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/data/cart/CartRepository.dart';
import 'package:challenge_03/usecase/UseCase.dart';

class UpdateCartItemQuantityUseCase extends UseCase<void> {
  final CartRepository cartRepository;

  int _quantity;
  CartItem _cartItem;

  UpdateCartItemQuantityUseCase(this.cartRepository);

  void setParams(int quantity, CartItem cartItem) {
    this._quantity = quantity;
    this._cartItem = cartItem;
  }

  @override
  Future<void> run() async {
    cartRepository
        .updateCartItemQuantity(_quantity, _cartItem)
        .then((updatedItem) => _removeCartItemIfEmpty(_cartItem));
  }

  void _removeCartItemIfEmpty(CartItem cartItem) {
    if (cartItem.isEmpty()) {
      cartRepository.removeCartItem(cartItem);
    }
  }
}
