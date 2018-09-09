import 'package:challenge_03/data/model/cart.dart';
import 'package:challenge_03/data/model/products.dart';

abstract class CartRepository {
  Cart getShoppingCart();
  void addProductToShoppingCart(Product product);
}

class CartRepositoryImpl implements CartRepository {
  static final CartRepositoryImpl cartRepository =
      new CartRepositoryImpl._internal();

  CartRepositoryImpl._internal();

  factory CartRepositoryImpl() => cartRepository;

  final Cart cart = Cart(new List());

  @override
  Cart getShoppingCart() {
    return cart;
  }

  @override
  void addProductToShoppingCart(Product product) {
    cart.items.add(CartItem(1, product));
  }
}
