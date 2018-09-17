// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return new Product(
      json['id'] as int,
      json['name'] as String,
      json['description'] as String,
      json['imageUrl'] as String,
      (json['price'] as num)?.toDouble());
}

abstract class _$ProductSerializerMixin {
  int get id;
  String get name;
  String get description;
  String get imageUrl;
  double get price;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
        'price': price
      };
}
