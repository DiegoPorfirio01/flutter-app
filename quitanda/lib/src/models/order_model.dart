import 'package:quitanda/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdAt;
  DateTime overDueDateTime;
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total;

  OrderModel({
    required this.id,
    required this.createdAt,
    required this.overDueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
}
