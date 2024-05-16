import 'dart:io';

import 'package:boutiq_provider/features/data/models/order/order_summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
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
                        onOrderList: (orders) => _orders.isNotEmpty
                            ? _buildOrderDataTable()
                            : Container(),
                        onOrderListError: (message) =>
                            Center(child: Text(message)),
                        orElse: () => _orders.isNotEmpty
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
        if (!isMobile)
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: _selectedOrder != null
                  ? OrderDetail(orderSummary: _selectedOrder!)
                  : Container(),
            ),
          ),
      ],
    );
  }

  Widget _buildOrderDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Order ID')),
          DataColumn(label: Text('Customer Name')),
          DataColumn(label: Text('Products')),
          DataColumn(label: Text('Order Status')),
          DataColumn(label: Text('Total Amount')),
        ],
        rows: [
          ..._orders.map((order) {
            final address = order.address!;
            final paymentData = order.paymentData!;
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
                DataCell(Text(address.name ?? '')),
                DataCell(Text((order.productItems?.length ?? 0).toString())),
                DataCell(Text(order.status?.name ?? '')),
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
              Text('Delivery address (${orderSummary.address?.label})',
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
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
                                '${productItem.productSize} * ${productItem.quantity}'),
                            Text('Total: ₹ ${productItem.totalAmount}'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
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
                    Text('₹ ${orderSummary.paymentData?.deliveryFee}'),
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
              Column(
                children: [
                  BlocBuilder<OrderBloc, OrderState>(
                    bloc: context.read<OrderBloc>()
                      ..add(GetOrderStatusTraces(
                          orderId: orderSummary.orderId ?? "")),
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return Center(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
