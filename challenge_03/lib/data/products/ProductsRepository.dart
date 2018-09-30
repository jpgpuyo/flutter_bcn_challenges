import 'dart:async';

import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/products/ProductsDbDataSource.dart';
import 'package:challenge_03/data/products/ProductsFileDataSource.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProductList();
}

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsFileDataSource productsFileDataSource;
  final ProductsDbDataSource productsDbDataSource;

  ProductsRepositoryImpl(
    this.productsFileDataSource,
    this.productsDbDataSource,
  );

  @override
  Future<List<Product>> getProductList() async {
    List<Product> productList = await productsFileDataSource.fetchProductList();
    await productsDbDataSource.clearProductList();
    await productsDbDataSource.saveProductList(productList);
    return productList;
  }
}
