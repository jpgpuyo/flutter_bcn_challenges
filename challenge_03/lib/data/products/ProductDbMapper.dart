import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/database/DbMapper.dart';

class ProductDbMapper extends DbMapper<Product> {
  static const String db_id = "id";
  static const db_name = "name";
  static const db_description = "description";
  static const db_imageUrl = "imageUrl";
  static const db_price = "price";

  ProductDbMapper();

  @override
  Product toModel(Map<String, dynamic> map) {
    return Product(
      map[db_id],
      map[db_name],
      map[db_description],
      map[db_imageUrl],
      map[db_price],
    );
  }

  @override
  Map<String, dynamic> toMap(Product model) {
    return {
      db_id: model.id,
      db_name: model.name,
      db_description: model.description,
      db_imageUrl: model.imageUrl,
      db_price: model.price,
    };
  }
}
