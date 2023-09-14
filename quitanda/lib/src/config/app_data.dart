import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/models/item_model.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/models/user_model.dart';

ItemModel apple = ItemModel(
  itemName: 'Maçã',
  imgUrl: 'assets/fruits/apple.png',
  unit: 'kg',
  price: 5.99,
  description: 'Maçãs frescas e selecionadas',
);

ItemModel apple1 = ItemModel(
  itemName: 'Mamão',
  imgUrl: 'assets/fruits/papaya.png',
  unit: 'Un',
  price: 5.99,
  description: 'Mamão do bom',
);

ItemModel apple2 = ItemModel(
  itemName: 'Kiwi',
  imgUrl: 'assets/fruits/kiwi.png',
  unit: 'kg',
  price: 5.99,
  description: 'Kiwi fresco e selecionado',
);

ItemModel apple3 = ItemModel(
  itemName: 'Manga',
  imgUrl: 'assets/fruits/mango.png',
  unit: 'kg',
  price: 5.99,
  description: 'Manga frescas e selecionadas',
);

ItemModel apple4 = ItemModel(
  itemName: 'Goiaba',
  imgUrl: 'assets/fruits/guava.png',
  unit: 'kg',
  price: 5.99,
  description: 'Goiaba frescas e selecionadas',
);

ItemModel apple5 = ItemModel(
  itemName: 'Uvas',
  imgUrl: 'assets/fruits/grape.png',
  unit: 'kg',
  price: 5.99,
  description: 'Uvas frescas e selecionadas',
);

List<ItemModel> items = [
  apple,
  apple1,
  apple2,
  apple3,
  apple4,
  apple5,
];

final List<String> categories = [
  'Frutas',
  'Verduras',
  'Legumes',
  'Carnes',
  'Bebidas',
  'Outros'
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: apple,
    quantity: 2,
  ),
  CartItemModel(
    item: apple1,
    quantity: 1,
  ),
  CartItemModel(
    item: apple2,
    quantity: 4,
  ),
  CartItemModel(
    item: apple3,
    quantity: 1,
  ),
  CartItemModel(
    item: apple4,
    quantity: 5,
  ),
  CartItemModel(
    item: apple5,
    quantity: 1,
  ),
];

final UserModel user = UserModel(
  nome: 'João',
  email: 'email@email.com.br',
  cpf: '000.000.000-00',
  telefone: '99 9 9999-9999',
  senha: '',
);

List<OrderModel> orders = [
  OrderModel(
    id: '1',
    createdAt: DateTime.now(),
    overDueDateTime: DateTime.now().add(const Duration(days: 2)),
    status: 'delivered',
    copyAndPaste: 'H5Hk89',
    total: 100.00,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: apple1,
        quantity: 2,
      ),
    ],
  ),
   OrderModel(
    id: '3',
    createdAt: DateTime.now(),
    overDueDateTime: DateTime.now().add(const Duration(days: 2)),
    status: 'pending_payment',
    copyAndPaste: 'H5Hk89',
    total: 100.00,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: apple1,
        quantity: 2,
      ),
    ],
  ),

  OrderModel(
    id: '2',
    createdAt: DateTime.now(),
    overDueDateTime: DateTime.now(),
    status: 'refused',
    copyAndPaste: 'H5Hk89',
    total: 100.00,
    items: [
      CartItemModel(
        item: apple2,
        quantity: 2,
      ),
      CartItemModel(
        item: apple3,
        quantity: 2,
      ),
    ],
  ),
];
