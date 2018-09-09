import 'package:challenge_03/data/repository/ProductsRepository.dart';
import 'package:challenge_03/data/model/products.dart';
import 'dart:async';

class GetProductListUseCase {

  final ProductsRepository productsRepository;

  GetProductListUseCase(this.productsRepository);

  final StreamController productsStreamController = new StreamController<List<Product>>();

  Stream<List<Product>> get productsListStream => productsStreamController.stream;

  Stream<List<Product>> stream() {
    return productsListStream;
  }

  void execute() {
    productsStreamController.add(productsRepository.getProductsList());
  }
}