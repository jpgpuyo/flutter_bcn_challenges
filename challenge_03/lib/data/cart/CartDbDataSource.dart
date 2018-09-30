import 'dart:async';
import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/data/cart/CartDb.dart';
import 'package:challenge_03/data/database/DbHelper.dart';

class CartDbDataSource {
  final DbHelper dbHelper;

  CartDbDataSource(this.dbHelper);

  Future<Cart> getCart() async {
    List<CartItemDb> cartItemDbList = await dbHelper.getCartItems();
    return Future.value(
      Cart(cartItemDbList.map((db) => db.toModel()).toList()),
    );
  }

  Future<CartItem> updateCart(CartItem cartItem) async {
    await dbHelper.updateCartItem(CartItemDb.fromModel(cartItem));
    return Future.value(cartItem);
  }

  Future removeFromCart(CartItem cartItem) async {
    await dbHelper.deleteCartItem(CartItemDb.fromModel(cartItem));
  }
}
