import 'dart:async';
import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/data/cart/CartDbMapper.dart';
import 'package:challenge_03/data/database/SqliteHelper.dart';

class CartDbDataSource {
  SqliteHelper sqliteHelper;
  CartItemDbMapper cartItemDbMapper;

  static const String TABLE_NAME = "CartItem";

  CartDbDataSource(this.sqliteHelper) {
    this.sqliteHelper = sqliteHelper;
    this.cartItemDbMapper = CartItemDbMapper();
  }

  Future<Cart> getCart() async {
    var result = await sqliteHelper.get(
        "SELECT * FROM $TABLE_NAME INNER JOIN Product ON CartItem.productId=Product.id");
    List<CartItem> cartItemList =
        result.map((rowDb) => cartItemDbMapper.toModel(rowDb)).toList();
    return Future.value(Cart(cartItemList));
  }

  Future<CartItem> updateCart(CartItem cartItem) async {
    await sqliteHelper.insertOrReplace(
        TABLE_NAME, cartItemDbMapper.toMap(cartItem));
    return Future.value(cartItem);
  }

  Future removeFromCart(CartItem cartItem) async {
    await sqliteHelper.delete(
        TABLE_NAME, "productId", cartItemDbMapper.toMap(cartItem));
  }
}
