import 'package:challenge_03/core/injection/Injector.dart';
import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/usecase/GetShoppingCartUseCase.dart';
import 'package:challenge_03/usecase/UpdateCartItemUseCase.dart';

abstract class ShoppingCartView {
  void renderCart(Cart cart);

  void cartUpdated();
}

class ShoppingCartPresenter {
  ShoppingCartView _view;

  GetShoppingCartUseCase getShoppingCartUseCase;
  UpdateCartItemUseCase updateCartItemUseCase;

  ShoppingCartPresenter(ShoppingCartView view) {
    this._view = view;
    this.getShoppingCartUseCase =
        new GetShoppingCartUseCase(Injector.cartRepository);
    this.updateCartItemUseCase =
        new UpdateCartItemUseCase(Injector.cartRepository);
  }

  void init() {
    getShoppingCartUseCase.subscribe((cart) => _view.renderCart(cart));
    updateCartItemUseCase.subscribe((_) => _view.cartUpdated());
  }

  void getShoppingCart() {
    getShoppingCartUseCase.execute();
  }

  void dispose() {
    getShoppingCartUseCase.unsubscribe();
    updateCartItemUseCase.unsubscribe();
  }

  void addCartItem(CartItem cartItem) {
    updateCartItemUseCase.setParams(cartItem.quantity + 1, cartItem);
    updateCartItemUseCase.execute();
  }

  void removeCartItem(CartItem cartItem) {
    updateCartItemUseCase.setParams(cartItem.quantity - 1, cartItem);
    updateCartItemUseCase.execute();
  }
}
