import 'dart:async';

import 'package:challenge_03/data/model/cart.dart';
import 'package:challenge_03/ui/shoppingcart/usecase/GetShoppingCartUseCase.dart';
import 'package:challenge_03/injection/Injector.dart';

abstract class ShoppingCartView {
  void renderCart(Cart cart);
}

class ShoppingCartPresenter {
  ShoppingCartView _view;

  StreamSubscription streamSubscription;
  GetShoppingCartUseCase getShoppingCartUseCase;

  ShoppingCartPresenter(ShoppingCartView view) {
    this._view = view;
    this.getShoppingCartUseCase =
        new GetShoppingCartUseCase(Injector.cartRepository);
  }

  void init() {
    streamSubscription = getShoppingCartUseCase.stream().listen((cart) {
      _view.renderCart(cart);
    });
  }

  void getShoppingCart() {
    getShoppingCartUseCase.execute();
  }

  void dispose() {
    if (streamSubscription != null) {
      streamSubscription.cancel();
    }
  }
}
