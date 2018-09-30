class SqliteTables {

  static const String _TABLE_PRODUCT = "CREATE TABLE Product" +
      "(" +
      "id INTEGER PRIMARY KEY," +
      "name TEXT," +
      "description TEXT," +
      "imageUrl TEXT," +
      "price REAL" +
      ")";

  static const String _TABLE_CART_ITEM = "CREATE TABLE CartItem" +
      "(" +
      "quantity INTEGER," +
      "productId INTEGER PRIMARY KEY" +
      ")";

  static List<String> getCreateTables() {
    return [
      _TABLE_PRODUCT,
      _TABLE_CART_ITEM
    ];
  }
}
