import 'dart:async';

import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/data/cart/CartRepository.dart';
import 'package:challenge_03/usecase/UseCase.dart';

class UpdateCartItemUseCase extends UseCase<void> {
  final CartRepository cartRepository;

  int _quantity;
  CartItem _cartItem;

  UpdateCartItemUseCase(this.cartRepository);

  void setParams(int quantity, CartItem cartItem) {
    this._quantity = quantity;
    this._cartItem = cartItem;
  }

  @override
  Future<void> run() async {
    return cartRepository
        .updateCartItem(_quantity, _cartItem);
  }
}
