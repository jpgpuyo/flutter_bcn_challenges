import 'package:challenge_03/core/model/Product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package:challenge_03/data/products/ProductDto.g.dart';

@JsonSerializable()
class ProductDto extends Object with _$ProductDtoSerializerMixin {
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

  ProductDto(this.id, this.name, this.description, this.imageUrl, this.price);

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Product toModel() {
    final id = this.id;
    final name = this.name;
    final description = this.description;
    final imageUrl = this.imageUrl;
    final price = this.price;

    return new Product(id, name, description, imageUrl, price);
  }
}
