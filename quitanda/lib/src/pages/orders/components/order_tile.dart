import 'package:flutter/material.dart';
import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/pages/common_widgets/payment_dialog.dart';
import 'package:quitanda/src/pages/orders/components/order_status_widget.dart';
import 'package:quitanda/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  OrderTile({super.key, required this.order});

  final OrderModel order;
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context)
            .copyWith(dividerColor: const Color.fromARGB(0, 255, 0, 0)),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdAt),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: order.items.map((orderItem) {
                          return _OrderItemWidget(
                            utilsServices: utilsServices,
                            orderItem: orderItem,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.grey.shade300,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overDueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                ),
                children: [
                  const TextSpan(
                    text: 'Total ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: utilsServices.priceToCurrency(order.total),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                onPressed: () {
                   showDialog(
                    context:context,
                    builder: (context) {
                      return PaymentDialog(order: order,);   
                    }
                  );
                },
                icon: const Icon(Icons.pix),
                label: const Text('Pagar com Pix'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    super.key,
    required this.utilsServices,
    required this.orderItem,
  });

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              orderItem.item.itemName,
            ),
          ),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}
