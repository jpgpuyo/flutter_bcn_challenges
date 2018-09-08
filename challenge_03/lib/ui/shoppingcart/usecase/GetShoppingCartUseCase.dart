import 'package:challenge_03/data/repository/CartRepository.dart';
import 'package:challenge_03/data/model/cart.dart';
import 'dart:async';

class GetShoppingCartUseCase {

  final CartRepository cartRepository;

  GetShoppingCartUseCase(this.cartRepository);

  final StreamController cartStreamController = new StreamController<Cart>();

  Stream<Cart> get cartUpdates => cartStreamController.stream;

  Stream<Cart> stream() {
    return cartUpdates;
  }

  void execute() {
    cartStreamController.add(cartRepository.getShoppingCart());
  }
}