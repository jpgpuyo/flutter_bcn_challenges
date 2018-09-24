import 'package:challenge_03/core/injection/Injector.dart';
import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/usecase/GetShoppingCartUseCase.dart';
import 'package:challenge_03/usecase/UpdateCartItemQuantityUseCase.dart';

abstract class ShoppingCartView {
  void renderCart(Cart cart);

  void cartUpdated();
}

class ShoppingCartPresenter {
  ShoppingCartView _view;

  GetShoppingCartUseCase getShoppingCartUseCase;
  UpdateCartItemQuantityUseCase updateCartItemQuantityUseCase;

  ShoppingCartPresenter(ShoppingCartView view) {
    this._view = view;
    this.getShoppingCartUseCase =
        new GetShoppingCartUseCase(Injector.cartRepository);
    this.updateCartItemQuantityUseCase =
        new UpdateCartItemQuantityUseCase(Injector.cartRepository);
  }

  void init() {
    getShoppingCartUseCase.subscribe((cart) => _view.renderCart(cart));
    updateCartItemQuantityUseCase.subscribe((cart) => _view.cartUpdated());
  }

  void getShoppingCart() {
    getShoppingCartUseCase.execute();
  }

  void dispose() {
    getShoppingCartUseCase.unsubscribe();
    updateCartItemQuantityUseCase.unsubscribe();
  }

  void addCartItem(CartItem cartItem) {
    updateCartItemQuantityUseCase.setParams(cartItem.quantity + 1, cartItem);
    updateCartItemQuantityUseCase.execute();
  }

  void removeCartItem(CartItem cartItem) {
    updateCartItemQuantityUseCase.setParams(cartItem.quantity - 1, cartItem);
    updateCartItemQuantityUseCase.execute();
  }
}
