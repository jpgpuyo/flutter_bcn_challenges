import 'products.dart';

class Cart {
  final List<CartItem> items;

  Cart(this.items);

  double getTotal() {
    return items
        .map((cartItem) => cartItem.quantity * cartItem.product.price)
        .reduce((value, element) => value + element);
  }
}

class CartItem {
  final int quantity;
  final Product product;

  CartItem(this.quantity, this.product);
}

final Cart cart = Cart(new List());
