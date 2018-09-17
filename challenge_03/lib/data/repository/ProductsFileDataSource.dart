import 'dart:async';
import 'dart:convert';

import 'package:challenge_03/data/model/ProductDto.dart';
import 'package:flutter/services.dart';

class ProductsFileDataSource {
  Future<List<ProductDto>> fetchProductList() async {
    String jsonString = await rootBundle.loadString('assets/products.json');
    final jsonResponse = json.decode(jsonString) as List;

    List<ProductDto> productList =
        jsonResponse.map((product) => ProductDto.fromJson(product)).toList();
    return productList;
  }
}
