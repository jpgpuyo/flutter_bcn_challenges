import 'package:challenge_03/core/model/Product.dart';

class ProductDb {
  static const String db_id = "id";
  static const db_name = "name";
  static const db_description = "description";
  static const db_imageUrl = "imageUrl";
  static const db_price = "price";

  int id;
  String name;
  String description;
  String imageUrl;
  double price;

  ProductDb(
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
  );

  factory ProductDb.fromMap(Map<String, dynamic> map) {
    return ProductDb(
      map[db_id],
      map[db_name],
      map[db_description],
      map[db_imageUrl],
      map[db_price],
    );
  }

  factory ProductDb.fromModel(Product product) {
    return ProductDb(
      product.id,
      product.name,
      product.description,
      product.imageUrl,
      product.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      db_id: id,
      db_name: name,
      db_description: description,
      db_imageUrl: imageUrl,
      db_price: price,
    };
  }

  Product toModel() {
    return Product(
      id = this.id,
      name = this.name,
      description = this.description,
      imageUrl = this.imageUrl,
      price = this.price,
    );
  }
}
