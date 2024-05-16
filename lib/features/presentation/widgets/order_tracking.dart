import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/order/order_summary.dart';

class TrackingView extends StatelessWidget {
  final List<OrderStatusTrace> orderStatusTraces;

  const TrackingView({Key? key, required this.orderStatusTraces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // Disable scrolling for the inner ListView
            itemCount: orderStatusTraces.length,
            separatorBuilder: (context, index) => Divider(),
            // Add a divider between list tiles
            itemBuilder: (context, index) {
              final trace = orderStatusTraces[index];
              final formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(
                DateTime.fromMillisecondsSinceEpoch(trace.timestamp * 1000,
                    isUtc: true),
              );
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  // Show order step number
                  foregroundColor: Colors.white,
                  // Customize the color as needed
                  child: Text((index + 1).toString()),
                ),
                title: Text(
                  trace.orderStatus.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  formattedDateTime,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
