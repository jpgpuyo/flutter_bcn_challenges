import 'dart:async';
import 'dart:convert';

import 'package:challenge_03/data/model/product.dart';
import 'package:flutter/services.dart';

class ProductsFileDataSource {
  Future<List<Product>> fetchProductList() async {
    String jsonString = await rootBundle.loadString('assets/products.json');
    final jsonResponse = json.decode(jsonString) as List;

    List<Product> productList =
        jsonResponse.map((product) => Product.fromJson(product)).toList();
    return productList;
  }
}
