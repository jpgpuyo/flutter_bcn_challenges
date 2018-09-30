import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/cart/CartDb.dart';
import 'package:challenge_03/data/database/DbMapper.dart';
import 'package:challenge_03/data/products/ProductDb.dart';

class ProductDbMapper extends DbMapper<ProductDb, Product> {
  static const String db_id = "id";
  static const db_name = "name";
  static const db_description = "description";
  static const db_imageUrl = "imageUrl";
  static const db_price = "price";

  ProductDbMapper();

  @override
  ProductDb fromMap(Map<String, dynamic> map) {
    return ProductDb(
      map[db_id],
      map[db_name],
      map[db_description],
      map[db_imageUrl],
      map[db_price],
    );
  }

  @override
  ProductDb fromModel(Product model) {
    return ProductDb(
      model.id,
      model.name,
      model.description,
      model.imageUrl,
      model.price,
    );
  }

  @override
  Map<String, dynamic> toMap(ProductDb db) {
    return {
      db_id: db.id,
      db_name: db.name,
      db_description: db.description,
      db_imageUrl: db.imageUrl,
      db_price: db.price,
    };
  }

  @override
  Product toModel(ProductDb db) {
    return Product(
      db.id,
      db.name,
      db.description,
      db.imageUrl,
      db.price,
    );
  }
}
