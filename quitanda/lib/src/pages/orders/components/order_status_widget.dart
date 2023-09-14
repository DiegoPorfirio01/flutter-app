import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  OrderStatusWidget({super.key, required this.status, required this.isOverdue});
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refused': 1,
    'paid': 2,
    'preparing_purchases': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(isActive: true, title: 'Pedido confirmado'),
        _CustomDivider(),
        if (currentStatus == 1) ...[
          _StatusDot(
            isActive: true,
            title: 'Pix estornado',
            backgroundColor: Colors.red.shade400,
          ),
        ] else if (isOverdue) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pagamento Pix Vencido',
            backgroundColor: Colors.red,
          ),
        ] else ...[
          _StatusDot(
            isActive: currentStatus >= 2,
            title: 'Pagamento',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 3,
            title: 'Preparando',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive:  currentStatus >= 4,
            title: 'Envio',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive:  currentStatus >= 5,
            title: 'Entregue',
          ),
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot(
      {super.key,
      required this.isActive,
      required this.title,
      this.backgroundColor});

  final bool isActive;
  final String title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
            color: isActive
                ? backgroundColor ?? CustomColors.customSwatchColor
                : Colors.white,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 12,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }
}
