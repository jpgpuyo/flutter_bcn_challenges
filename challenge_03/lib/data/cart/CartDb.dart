class CartItemDb {
  int quantity;
  int productId;
  String productName;
  String productDescription;
  String productImageUrl;
  double productPrice;

  CartItemDb(this.quantity, this.productId, this.productName,
      this.productDescription, this.productImageUrl, this.productPrice);
}
