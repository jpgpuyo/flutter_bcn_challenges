import 'dart:async';

import 'package:challenge_03/data/cart/CartRepository.dart';
import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/usecase/UseCase.dart';

class GetShoppingCartUseCase extends UseCase<Cart> {
  CartRepository cartRepository;

  GetShoppingCartUseCase(this.cartRepository);

  @override
  Future<Cart> run() {
    return cartRepository.getShoppingCart();
  }
}
