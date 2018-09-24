import 'dart:async';

import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/products/ProductsRepository.dart';
import 'package:challenge_03/usecase/UseCase.dart';

class GetProductListUseCase extends UseCase<List<Product>> {
  final ProductsRepository productsRepository;

  GetProductListUseCase(this.productsRepository);

  @override
  Future<List<Product>> run() {
    return productsRepository.getProductList();
  }
}
