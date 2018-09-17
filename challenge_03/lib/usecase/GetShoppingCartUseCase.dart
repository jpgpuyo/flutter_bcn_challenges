import 'dart:async';

import 'package:challenge_03/data/cart/CartRepository.dart';
import 'package:challenge_03/core/model/cart.dart';
import 'package:challenge_03/usecase/UseCase.dart';

class GetShoppingCartUseCase extends UseCase<Cart> {
  CartRepository cartRepository;

  GetShoppingCartUseCase(this.cartRepository);

  void execute() {
    input.add(null);
  }

  @override
  Future<Cart> run(){
    return cartRepository.getShoppingCart();
  }
}
