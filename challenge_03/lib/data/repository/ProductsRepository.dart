import 'dart:async';

import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/repository/ProductsFileDataSource.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProductList();
}

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsFileDataSource productsFileDataSource;

  ProductsRepositoryImpl(this.productsFileDataSource);

  @override
  Future<List<Product>> getProductList() {
    return productsFileDataSource.fetchProductList().then((productListDto) =>
        productListDto.map((dto) => dto.toModel()).toList());
  }
}
