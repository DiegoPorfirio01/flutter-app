import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/services/utils_services.dart';

class PaymentDialog extends StatelessWidget {
  PaymentDialog({super.key, required this.order});

  final OrderModel order;
  final utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pagar com Pix',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                QrImageView(
                  data: '222222222',
                  size: 200,
                  version: QrVersions.auto,
                ),
                Text(
                  'Vencimento: ${utilsServices.formatDateTime(order.overDueDateTime)}',
                ),
                Text(
                  'Total: ${utilsServices.priceToCurrency(order.total)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                OutlinedButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.copy),
                  label: const Text('Copiar código'),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close)),
          ),
        ],
      ),
    );
  }
}
