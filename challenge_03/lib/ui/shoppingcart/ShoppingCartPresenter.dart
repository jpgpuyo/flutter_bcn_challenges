import 'package:challenge_03/core/injection/Injector.dart';
import 'package:challenge_03/data/model/cart.dart';
import 'package:challenge_03/usecase/GetShoppingCartUseCase.dart';

abstract class ShoppingCartView {
  void renderCart(Cart cart);
}

class ShoppingCartPresenter {
  ShoppingCartView _view;

  GetShoppingCartUseCase getShoppingCartUseCase;

  ShoppingCartPresenter(ShoppingCartView view) {
    this._view = view;
    this.getShoppingCartUseCase =
        new GetShoppingCartUseCase(Injector.cartRepository);
  }

  void init() {
    getShoppingCartUseCase.subscribe((cart) => _view.renderCart(cart));
  }

  void getShoppingCart() {
    getShoppingCartUseCase.execute();
  }

  void dispose() {
    getShoppingCartUseCase.unsubscribe();
  }
}
