import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/cart/CartDb.dart';
import 'package:challenge_03/data/database/DbMapper.dart';

class CartItemDbMapper extends DbMapper<CartItemDb, CartItem> {
  static const String db_quantity = "quantity";
  static const db_productId = "productId";
  static const db_productName = "name";
  static const db_productDescription = "description";
  static const db_productImageUrl = "imageUrl";
  static const db_productPrice = "price";

  CartItemDbMapper();

  @override
  CartItemDb fromMap(Map<String, dynamic> map) {
    return CartItemDb(
      map[db_quantity],
      map[db_productId],
      map[db_productName],
      map[db_productDescription],
      map[db_productImageUrl],
      map[db_productPrice],
    );
  }

  @override
  CartItemDb fromModel(CartItem model) {
    return CartItemDb(
      model.quantity,
      model.product.id,
      model.product.name,
      model.product.description,
      model.product.imageUrl,
      model.product.price,
    );
  }

  @override
  Map<String, dynamic> toMap(CartItemDb db) {
    return {
      db_quantity: db.quantity,
      db_productId: db.productId,
    };
  }

  @override
  CartItem toModel(CartItemDb db) {
    return CartItem(
      db.quantity,
      Product(
        db.productId,
        db.productName,
        db.productDescription,
        db.productImageUrl,
        db.productPrice,
      ),
    );
  }
}
