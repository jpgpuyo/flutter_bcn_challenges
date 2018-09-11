import 'package:challenge_03/data/repository/ProductsRepository.dart';
import 'package:challenge_03/data/model/products.dart';
import 'package:challenge_03/usecase/UseCase.dart';

class GetProductListUseCase extends UseCase<List<Product>>{

  final ProductsRepository productsRepository;

  GetProductListUseCase(this.productsRepository);

  void execute() {
    input.add(null);
  }

  @override
  List<Product> run() {
    return productsRepository.getProductsList();
  }
}