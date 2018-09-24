import 'dart:async';

import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/products/ProductsRepository.dart';
import 'package:challenge_03/data/cart/CartRepository.dart';
import 'package:challenge_03/usecase/UseCase.dart';

class AddProductToCartUseCase extends UseCase<Product> {
  final ProductsRepository productsRepository;

  final CartRepository cartRepository;

  Product _product;

  AddProductToCartUseCase(this.productsRepository, this.cartRepository);

  void setParams(Product product) {
    this._product = product;
  }

  @override
  Future<Product> run() async {
    return cartRepository.addProductToShoppingCart(_product);
  }
}
