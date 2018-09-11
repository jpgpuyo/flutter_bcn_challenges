import 'package:challenge_03/data/repository/ProductsRepository.dart';
import 'package:challenge_03/data/repository/CartRepository.dart';
import 'package:challenge_03/data/model/products.dart';
import 'package:challenge_03/usecase/UseCase.dart';

class AddProductToCartUseCase extends UseCase<Product> {
  final ProductsRepository productsRepository;

  final CartRepository cartRepository;

  Product product;

  AddProductToCartUseCase(this.productsRepository, this.cartRepository);

  void execute(Product product) {
    this.product = product;
    input.add(product);
  }

  @override
  Product run() {
    cartRepository.addProductToShoppingCart(product);
    return product;
  }
}
