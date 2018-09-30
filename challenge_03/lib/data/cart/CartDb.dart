import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/core/model/Product.dart';

class CartItemDb {
  static const String db_quantity = "quantity";
  static const db_productId = "productId";
  static const db_productName = "name";
  static const db_productDescription = "description";
  static const db_productImageUrl = "imageUrl";
  static const db_productPrice = "price";

  int quantity;
  int productId;
  String productName;
  String productDescription;
  String productImageUrl;
  double productPrice;

  CartItemDb(this.quantity, this.productId, this.productName,
      this.productDescription, this.productImageUrl, this.productPrice);

  factory CartItemDb.fromMap(Map<String, dynamic> map) {
    return CartItemDb(
      map[db_quantity],
      map[db_productId],
      map[db_productName],
      map[db_productDescription],
      map[db_productImageUrl],
      map[db_productPrice],
    );
  }

  factory CartItemDb.fromModel(CartItem model) {
    return CartItemDb(
      model.quantity,
      model.product.id,
      model.product.name,
      model.product.description,
      model.product.imageUrl,
      model.product.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      db_quantity: quantity,
      db_productId: productId,
    };
  }

  CartItem toModel() {
    return CartItem(
      this.quantity,
      Product(
        this.productId,
        this.productName,
        this.productDescription,
        this.productImageUrl,
        this.productPrice,
      ),
    );
  }
}
