import 'package:challenge_03/data/repository/ProductsRepository.dart';
import 'package:challenge_03/data/repository/CartRepository.dart';
import 'package:challenge_03/data/model/products.dart';
import 'dart:async';

class AddProductToCartUseCase {

  final ProductsRepository productsRepository;

  final CartRepository cartRepository;

  AddProductToCartUseCase(this.productsRepository, this.cartRepository);

  final StreamController streamController = new StreamController<Product>();

  Stream<Product> get addProductStream => streamController.stream;

  Stream<Product> stream() {
    return addProductStream;
  }

  void execute(Product product) {
    cartRepository.addProductToShoppingCart(product);
    streamController.add(product);
  }
}