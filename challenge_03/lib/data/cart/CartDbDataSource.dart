import 'dart:async';
import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/data/cart/CartDbMapper.dart';
import 'package:challenge_03/data/database/DbHelper.dart';

class CartDbDataSource {
  DbHelper dbHelper;
  CartItemDbMapper cartItemDbMapper;

  CartDbDataSource(this.dbHelper) {
    this.dbHelper = dbHelper;
    this.cartItemDbMapper = CartItemDbMapper();
  }

  Future<Cart> getCart() async {
    var result = await dbHelper.get(
        "SELECT * FROM CartItem INNER JOIN Product ON CartItem.productId=Product.id");
    List<CartItem> cartItemList = result
        .map((rowDb) => cartItemDbMapper.fromMap(rowDb))
        .map((db) => cartItemDbMapper.toModel(db))
        .toList();
    return Future.value(Cart(cartItemList));
  }

  Future<CartItem> updateCart(CartItem cartItem) async {
    await dbHelper.insertOrReplace("CartItem",
        cartItemDbMapper.toMap(cartItemDbMapper.fromModel(cartItem)));
    return Future.value(cartItem);
  }

  Future removeFromCart(CartItem cartItem) async {
    await dbHelper.delete("CartItem", "productId",
        cartItemDbMapper.fromModel(cartItem).productId);
  }
}
