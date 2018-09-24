import 'dart:async';
import 'dart:convert';

import 'package:challenge_03/data/products/ProductDto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ProductsFileDataSource {
  Future<List<ProductDto>> fetchProductList() async {
    String jsonString = await rootBundle.loadString('assets/products.json');
    return compute(_parseProductList, jsonString);
  }

  ///Compute will execute this in a new thread, but only can execute static or global methods
  static List<ProductDto> _parseProductList(String jsonString) {
    final jsonResponse = json.decode(jsonString) as List;
    return jsonResponse.map((product) => ProductDto.fromJson(product)).toList();
  }
}
