import 'dart:async';
import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/data/cart/CartDbMapper.dart';
import 'package:challenge_03/data/database/DbHelper.dart';

class CartDbDataSource {
  DbHelper dbHelper;
  CartItemDbMapper cartItemDbMapper;
  String tableName;

  CartDbDataSource(this.dbHelper) {
    this.dbHelper = dbHelper;
    this.cartItemDbMapper = CartItemDbMapper();
    this.tableName = DbHelper.tableCartItem;
  }

  Future<Cart> getCart() async {
    var result = await dbHelper.get(
        "SELECT * FROM $tableName INNER JOIN Product ON CartItem.productId=Product.id");
    List<CartItem> cartItemList =
        result.map((rowDb) => cartItemDbMapper.toModel(rowDb)).toList();
    return Future.value(Cart(cartItemList));
  }

  Future<CartItem> updateCart(CartItem cartItem) async {
    await dbHelper.insertOrReplace(tableName, cartItemDbMapper.toMap(cartItem));
    return Future.value(cartItem);
  }

  Future removeFromCart(CartItem cartItem) async {
    await dbHelper.delete(
        tableName, "productId", cartItemDbMapper.toMap(cartItem)["productId"]);
  }
}
