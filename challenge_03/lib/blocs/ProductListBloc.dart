import 'package:challenge_03/data/model/products.dart';
import 'package:challenge_03/data/repository/CartRepository.dart';
import 'package:challenge_03/data/repository/ProductsRepository.dart';

import 'BlocProvider.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class ProductListBloc implements BlocBase {
  CartRepository cartRepository;
  ProductsRepository productsRepository;

  final StreamController _inProductListController =
      new StreamController<List<Product>>.broadcast();
  final StreamController _outProductListController =
      new BehaviorSubject<List<Product>>();

  StreamSink get inProductList => _inProductListController.sink;

  Stream<List<Product>> get outProductList => _outProductListController.stream;

  final StreamController _inAddProductController =
      new StreamController<int>.broadcast();
  final StreamController _outAddProductController =
      new BehaviorSubject<Product>();

  StreamSink get inAddProduct => _inAddProductController.sink;

  Stream get outAddProduct => _outAddProductController.stream;

  ProductListBloc(
      CartRepository cartRepository, ProductsRepository productsRepository) {
    this.cartRepository = cartRepository;
    this.productsRepository = productsRepository;

    _handleGetProductListUseCase(productsRepository);
    _handleAddProductToCartUseCase(productsRepository, cartRepository);
  }

  void _handleAddProductToCartUseCase(
      ProductsRepository productsRepository, CartRepository cartRepository) {
    _inAddProductController.stream.listen((productId) {
      Product product = productsRepository
          .getProductsList()
          .firstWhere((item) => item.id == productId);
      cartRepository.addProductToShoppingCart(product);
      _outAddProductController.add(product);
    });
  }

  void _handleGetProductListUseCase(ProductsRepository productsRepository) {
    _inProductListController.stream.listen((_) {
      _outProductListController.add(productsRepository.getProductsList());
    });
  }

  @override
  void dispose() {
    _inProductListController.close();
    _inAddProductController.close();
    _outProductListController.close();
    _outAddProductController.close();
  }
}
