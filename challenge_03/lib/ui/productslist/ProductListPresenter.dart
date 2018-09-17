import 'package:challenge_03/core/injection/Injector.dart';
import 'package:challenge_03/data/model/product.dart';
import 'package:challenge_03/usecase/GetProductListUseCase.dart';
import 'package:challenge_03/usecase/AddProductToCartUseCase.dart';

abstract class ProductListView {
  void renderProductsList(List<Product> productsList);

  void productAdded(Product product);
}

class ProductListPresenter {
  ProductListView _view;

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
    getProductListUseCase.subscribe((productsList) {
      _view.renderProductsList(productsList);
    });
    addProductToCartUseCase.subscribe((productAdded) {
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
    getProductListUseCase.unsubscribe();
    addProductToCartUseCase.unsubscribe();
  }
}
