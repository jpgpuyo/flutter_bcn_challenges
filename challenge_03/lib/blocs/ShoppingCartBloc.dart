import 'package:challenge_03/data/repository/CartRepository.dart';

import 'BlocProvider.dart';
import 'dart:async';
import 'package:challenge_03/data/model/cart.dart';
import 'package:rxdart/rxdart.dart';

class ShoppingCartBloc implements BlocBase {
  CartRepository cartRepository;

  final StreamController _inController = new StreamController<Cart>.broadcast();

  StreamSink get _shoppingCartRequest => _inController.sink;

  final StreamController _outController = new BehaviorSubject<Cart>();

  Stream<Cart> get shoppingCartStream => _outController.stream;

  ShoppingCartBloc(CartRepository cartRepository) {
    this.cartRepository = cartRepository;

    _inController.stream.listen((_) {
      _outController.add(cartRepository.getShoppingCart());
    });
  }

  void getShoppingCart() {
    _shoppingCartRequest.add(null);
  }

  @override
  void dispose() {
    _inController.close();
    _outController.close();
  }
}
