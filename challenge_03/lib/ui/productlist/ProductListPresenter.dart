import 'package:challenge_03/core/injection/Injector.dart';
import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/usecase/GetProductListUseCase.dart';
import 'package:challenge_03/usecase/AddProductToCartUseCase.dart';

abstract class ProductListView {
  void showLoading();

  void renderProductList(List<Product> productList);

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
    getProductListUseCase.subscribe((productList) {
      _view.renderProductList(productList);
    });
    addProductToCartUseCase.subscribe((cartItem) {
      _view.productAdded(cartItem.product);
    });
  }

  void getProductList() {
    getProductListUseCase.execute();
  }

  void addProductToCart(Product product) {
    addProductToCartUseCase.setParams(product);
    addProductToCartUseCase.execute();
  }

  void dispose() {
    getProductListUseCase.unsubscribe();
    addProductToCartUseCase.unsubscribe();
  }
}
