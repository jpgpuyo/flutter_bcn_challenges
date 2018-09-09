import 'dart:async';

import 'package:challenge_03/data/model/products.dart';
import 'usecase/GetProductListUseCase.dart';
import 'usecase/AddProductToCartUseCase.dart';
import 'package:challenge_03/injection/Injector.dart';

abstract class ProductListView {
  void renderProductsList(List<Product> productsList);
  void productAdded(Product product);
}

class ProductListPresenter {
  ProductListView _view;

  StreamSubscription getProductListSubscription;
  StreamSubscription addProductToCartSubscription;

  GetProductListUseCase getProductListUseCase;
  AddProductToCartUseCase addProductToCartUseCase;

  ProductListPresenter(ProductListView view) {
    this._view = view;
    this.getProductListUseCase =
        new GetProductListUseCase(Injector.productsRepository);
    this.addProductToCartUseCase = new AddProductToCartUseCase(
        Injector.productsRepository, Injector.cartRepository);
  }

  void init() {
    getProductListSubscription = getProductListUseCase.stream().listen((productsList) {
      _view.renderProductsList(productsList);
    });
    addProductToCartSubscription = addProductToCartUseCase.stream().listen((productAdded) {
      _view.productAdded(productAdded);
    });

  }

  void getProductList() {
    getProductListUseCase.execute();
  }

  void addProductToCart(Product product) {
    addProductToCartUseCase.execute(product);
  }

  void dispose() {
    if (getProductListSubscription != null) {
      getProductListSubscription.cancel();
    }
    if (addProductToCartSubscription != null) {
      addProductToCartSubscription.cancel();
    }
  }
}
