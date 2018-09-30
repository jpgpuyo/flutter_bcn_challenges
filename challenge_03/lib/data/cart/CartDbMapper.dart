import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/database/DbMapper.dart';

class CartItemDbMapper extends DbMapper<CartItem> {
  static const String db_quantity = "quantity";
  static const db_productId = "productId";
  static const db_productName = "name";
  static const db_productDescription = "description";
  static const db_productImageUrl = "imageUrl";
  static const db_productPrice = "price";

  CartItemDbMapper();

  @override
  CartItem toModel(Map<String, dynamic> map) {
    return CartItem(
      map[db_quantity],
      Product(
        map[db_productId],
        map[db_productName],
        map[db_productDescription],
        map[db_productImageUrl],
        map[db_productPrice],
      ),
    );
  }

  @override
  Map<String, dynamic> toMap(CartItem model) {
    return {
      db_quantity: model.quantity,
      db_productId: model.product.id,
    };
  }
}
