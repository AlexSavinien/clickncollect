import 'package:clickncollect_app/models/customer.dart';
import 'package:clickncollect_app/models/product.dart';
import 'package:clickncollect_app/models/shop.dart';

class Order {
  Customer customer;
  Shop shop;
  List<Product> products;
  String deliveryAdress;
  DateTime expeditionDate;
  DateTime deliveryDate;
}
