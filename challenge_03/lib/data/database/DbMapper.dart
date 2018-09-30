import 'package:challenge_03/core/model/Cart.dart';
import 'package:challenge_03/core/model/Product.dart';
import 'package:challenge_03/data/cart/CartDb.dart';

abstract class DbMapper<D, M> {
  D fromMap(Map<String, dynamic> map);

  D fromModel(M model);

  Map<String, dynamic> toMap(D db);

  M toModel(D db);
}
