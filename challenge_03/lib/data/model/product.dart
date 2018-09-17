import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Object with _$ProductSerializerMixin {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'imageUrl')
  final String imageUrl;

  @JsonKey(name: 'price')
  final double price;

  Product(this.id, this.name, this.description, this.imageUrl, this.price);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
