import 'package:boutiq_provider/features/data/models/order/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/responsive.dart';
import '../bloc/order/order_bloc.dart';

class ProviderOrder extends StatelessWidget {
  const ProviderOrder({super.key});

  @override
  Widget build(BuildContext context) {
    // OverlayEntry? _overlayEntry;
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 150).floor();
    crossAxisCount = crossAxisCount.clamp(1, 4);
    final isMobile = Responsive.isMobile(context);
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<OrderBloc, OrderState>(
            bloc: context.read<OrderBloc>()
              ..add(const GetOrders(providerID: '2342024PROV0662')),
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                onOrderList: (orders) {
                  // _overlayEntry?.remove();
                  if (isMobile) {
                    return _buildGridView(orders, 2);
                  } else {
                    return _buildGridView(orders, 4);
                  }
                },
                onOrderListError: (message) {
                  return Center(
                    child: Text(message),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGridView(List<OrderSummary> orders, int count) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: orders.length,
      itemBuilder: (BuildContext context, int index) {
        final order = orders[index];
        final address = order.address!;
        final paymentData = order.paymentData!;
        final productItemsSize = order.productItems!.length;

        return GestureDetector(
          onTap: () {
            // Handle tap on order
            // You can navigate to order details screen or show more information
          },
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order ID: ${order.orderId}'),
                  Text('Customer Name: ${address.name}'),
                  Text('Address: ${address.address}'),
                  Text('Mobile Number: ${address.mobileNumber}'),
                  Text('Product Items Size: $productItemsSize'),
                  Text('Order Status: ${order.status}'),
                  Text('Total Amount: ${paymentData.totalAmount}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
