import 'dart:io';

import 'package:boutiq_provider/core/common/extension/string_ext.dart';
import 'package:boutiq_provider/features/data/models/order/order_summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/themes/color_scheme.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/size.dart';
import '../bloc/order/order_bloc.dart';
import 'order_tracking.dart';

class ProviderOrder extends StatefulWidget {
  const ProviderOrder({Key? key}) : super(key: key);

  @override
  _ProviderOrderState createState() => _ProviderOrderState();
}

class _ProviderOrderState extends State<ProviderOrder> {
  late OrderBloc _orderBloc;
  List<OrderSummary> _orders = [];
  OrderSummary? _selectedOrder;

  @override
  void initState() {
    super.initState();
    _orderBloc = context.read<OrderBloc>()
      ..add(const GetOrders(providerID: '2342024PROV0662'));
  }

  @override
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height, // Make sure the container takes the full height
              child: Column(
                children: [
                  BlocListener<OrderBloc, OrderState>(
                    bloc: _orderBloc,
                    listener: (context, state) {
                      state.maybeWhen(
                        onOrderList: (orders) {
                          setState(() {
                            _orders = orders;
                          });
                        },
                        orElse: () {},
                      );
                    },
                    child: BlocBuilder<OrderBloc, OrderState>(
                      bloc: _orderBloc,
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () =>
                          const Center(child: CircularProgressIndicator()),
                          onOrderList: (orders) =>
                          _orders.isNotEmpty
                              ? _buildOrderDataTable()
                              : Container(),
                          onOrderListError: (message) =>
                              Center(child: Text(message)),
                          orElse: () =>
                          _orders.isNotEmpty
                              ? _buildOrderDataTable()
                              : Container(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (!isMobile)
          Expanded(
            flex: 3,
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height, // Make sure the container takes the full height
              padding: const EdgeInsets.all(0.0),
              child: _selectedOrder != null
                  ? OrderDetail(orderSummary: _selectedOrder!)
                  : Container(),
            ),
          ),
      ],
    );
  }


  Color _getStatusColor(OrderStatus? status) {
    switch (status) {
      case OrderStatus.CREATED:
        return AppColors.orange.withOpacity(0.5);
      case OrderStatus.SHIPPED:
        return AppColors.yellow.withOpacity(0.5);
      case OrderStatus.DELIVERED:
        return AppColors.green.withOpacity(0.5);
      default:
        return Colors.grey; // Default color for other statuses
    }
  }

  Widget _buildOrderDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Order ID')),
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Customer Name')),
          DataColumn(label: Text('Products')),
          DataColumn(label: Text('Order Status')),
          DataColumn(label: Text('Total Amount')),
        ],
        rows: [
          ..._orders.map((order) {
            final address = order.address!;
            final paymentData = order.paymentData!;
            final formattedDateTime = order.updatedAt != null
                ? DateFormat('yyyy-MM-dd HH:mm').format(
                DateTime.fromMillisecondsSinceEpoch(order.updatedAt! * 1000)
            ) : 'N/A';
            return DataRow(
              selected: _selectedOrder == order,
              onSelectChanged: (selected) {
                if (selected != null && selected) {
                  setState(() {
                    _selectedOrder = order;
                  });
                }
              },
              cells: [
                DataCell(Text(order.orderId ?? '')),
                DataCell(Text(formattedDateTime)),
                DataCell(Text(address.name ?? '')),
                DataCell(Text((order.productItems?.length ?? 0).toString())),
                DataCell(
                    Container(
                      decoration: BoxDecoration(
                        color: _getStatusColor(order.status),
                        // Set your desired background color here
                        borderRadius: BorderRadius.circular(
                            10), // Set the border radius
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        child: Text(
                          order.status?.name.toLowerCase().capitalize() ?? '',
                          style: const TextStyle(color: Colors
                              .black), // Set the text color
                        ),
                      ),
                    )),
                DataCell(Text(paymentData.totalAmount.toString())),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class OrderDetail extends StatelessWidget {
  final OrderSummary orderSummary;

  const OrderDetail({Key? key, required this.orderSummary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail (${orderSummary.orderId})'),
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Status detail',
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              ),
              Column(
                children: [
                  BlocBuilder<OrderBloc, OrderState>(
                    bloc: context.read<OrderBloc>()
                      ..add(GetOrderStatusTraces(
                          orderId: orderSummary.orderId ?? "")),
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        orderStatusTracesList: (orderStatusTraces) {
                          return TrackingView(
                              orderStatusTraces: orderStatusTraces);
                        },
                        orderStatusTracesListError: (message) {
                          return Center(
                            child: Text(message),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const Divider(thickness: 1.0),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Delivery address (${orderSummary.address?.label})',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      orderSummary.address?.name ?? '',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      orderSummary.address?.address ?? '',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    Text('${orderSummary.address?.mobileNumber}'),
                  ],
                ),
              ),
              const Divider(thickness: 1.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Payment detail',
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Sub total'),
                    Text('₹ ${orderSummary.paymentData?.subTotalAmount}'),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Shipping Fee'),
                    Text('₹ ${orderSummary.paymentData?.deliveryCharge}'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${orderSummary.paymentData?.totalAmount}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1.0),
              const Text('Item Summary',
                  style:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              ListView.builder(
                shrinkWrap: true,
                itemCount: orderSummary.productItems?.length,
                itemBuilder: (context, index) {
                  final productItem = orderSummary.productItems?[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        kIsWeb
                            ? Image.network(
                          productItem!.imageUrl ?? "",
                          width: 100,
                          height: 100,
                        )
                            : Image.file(
                          File(productItem!.imageUrl ?? ""),
                          width: 100,
                          height: 100,
                        ),
                        const HorizontalMargin(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productItem.name.toString()),
                            Text(
                                '${productItem.productSize} * ${productItem
                                    .quantity}'),
                            Text('Total: ₹ ${productItem.totalAmount}'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    _showActionsBottomSheet(context);
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Change Status',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showActionsBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Mark order as',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600], // Light gray color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Shipped',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black, // Light gray color
                        fontWeight: FontWeight.bold,
                      ))),
              onTap: () {
                Navigator.pop(context);
                _performAction(context, OrderStatus.SHIPPED);
              },
            ),
            ListTile(
              title: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Delivered',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black, // Light gray color
                        fontWeight: FontWeight.bold,
                      ))),
              onTap: () {
                Navigator.pop(context);
                _performAction(context, OrderStatus.DELIVERED);
              },
            ),
          ],
        );
      },
    );
  }

  void _performAction(BuildContext context, OrderStatus state) {
    context.read<OrderBloc>().add(UpdateOrderStatus(
      orderId: orderSummary.orderId ?? "",
      status: state,
    ));
  }
}
