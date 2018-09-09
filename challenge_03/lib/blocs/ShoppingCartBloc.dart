import 'package:challenge_03/data/repository/CartRepository.dart';

import 'BlocProvider.dart';
import 'dart:async';
import 'package:challenge_03/data/model/cart.dart';
import 'package:rxdart/rxdart.dart';

class ShoppingCartBloc implements BlocBase {
  CartRepository cartRepository;

  final StreamController _inShoppingCartController =
      new StreamController<Cart>.broadcast();

  final StreamController _outShoppingCartController =
      new BehaviorSubject<Cart>();

  StreamSink get inShoppingCart => _inShoppingCartController.sink;

  Stream<Cart> get outShoppingCart => _outShoppingCartController.stream;

  ShoppingCartBloc(CartRepository cartRepository) {
    this.cartRepository = cartRepository;

    _handleGetShoppingListUseCase(cartRepository);
  }

  void _handleGetShoppingListUseCase(CartRepository cartRepository) {
    _inShoppingCartController.stream.listen((_) {
      _outShoppingCartController.add(cartRepository.getShoppingCart());
    });
  }

  @override
  void dispose() {
    _inShoppingCartController.close();
    _outShoppingCartController.close();
  }
}
