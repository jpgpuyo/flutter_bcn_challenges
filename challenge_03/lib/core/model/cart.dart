import 'package:challenge_03/core/model/Product.dart';

class Cart {
  final List<CartItem> items;

  Cart(this.items);

  List<CartItem> getItems() {
    return items;
  }

  int getTotalItems() {
    return items.length;
  }

  double getTotalPrice() {
    return items
        .map((cartItem) => cartItem.quantity * cartItem.product.price)
        .reduce((value, element) => value + element);
  }
}

class CartItem {
  final int quantity;
  final Product product;

  CartItem(this.quantity, this.product);

  double getPrice() {
    return quantity * product.price;
  }
}
