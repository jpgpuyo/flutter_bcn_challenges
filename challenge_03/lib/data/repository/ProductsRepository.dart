import 'package:challenge_03/data/model/products.dart';

abstract class ProductsRepository {
  List<Product> getProductsList();
}

class ProductsRepositoryImpl implements ProductsRepository {
  final products = [
    Product(1, "Forlayo", "Forlayo lorem ipsum", "http://placekitten.com/80/80",
        100.0),
    Product(2, "Forlayo", "Forlayo lorem ipsum", "http://placekitten.com/80/80",
        100.0),
    Product(3, "Forlayo", "Forlayo lorem ipsum", "http://placekitten.com/80/80",
        100.0),
    Product(4, "Forlayo", "Forlayo lorem ipsum", "http://placekitten.com/80/80",
        100.0),
    Product(5, "Forlayo", "Forlayo lorem ipsum", "http://placekitten.com/80/80",
        100.0),
    Product(6, "Forlayo", "Forlayo lorem ipsum", "http://placekitten.com/80/80",
        100.0),
    Product(7, "Forlayo", "Forlayo lorem ipsum", "http://placekitten.com/80/80",
        100.0),
    Product(8, "Forlayo", "Forlayo lorem ipsum", "http://placekitten.com/80/80",
        100.0),
    Product(9, "Forlayo", "Forlayo lorem ipsum", "http://placekitten.com/80/80",
        100.0),
    Product(10, "Forlayo", "Forlayo lorem ipsum",
        "http://placekitten.com/80/80", 100.0),
    Product(11, "Forlayo", "Forlayo lorem ipsum",
        "http://placekitten.com/80/80", 100.0),
    Product(12, "Forlayo", "Forlayo lorem ipsum",
        "http://placekitten.com/80/80", 100.0)
  ];

  @override
  List<Product> getProductsList() {
    return products;
  }
}
