import 'package:boutiq_provider/features/data/datasource/remote/provider_remote_firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/utils/responsive.dart';
import '../../data/models/provider/order_dashboard_resp.dart';
import '../../domain/repositories/provider_repo.dart';
import '../bloc/provider/provider_bloc.dart';

class DashboardBlocProvider extends StatelessWidget {
  final Widget child;

  const DashboardBlocProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProviderBloc(
        providerRepo: GetIt.instance<ProviderRepo>(),
      )..add(const GetDashboardDetail()),
      child: child,
    );
  }
}


class DashboardDetail extends StatefulWidget {
  const DashboardDetail({super.key});

  @override
  _DashboardDetailState createState() => _DashboardDetailState();
}

class _DashboardDetailState extends State<DashboardDetail> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 150).floor();
    crossAxisCount = crossAxisCount.clamp(1, 4);
    final isMobile = Responsive.isMobile(context);

    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ProviderBloc, ProviderState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                onOrderDashboardDetail: (dashboardData) {
                  return isMobile
                      ? _buildGridView(dashboardData, 2)
                      : _buildGridView(dashboardData, 6);
                },
                onOrderDashboardDetailError: (message) {
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


  Widget _buildDashboardCard({required String title, required String value}) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView(OrderDashboardResp data, int crossAxisCount) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildDashboardCard(
          title: 'Total Orders',
          value: data.orders.toString(),
        ),
        _buildDashboardCard(
          title: 'Total Amount',
          value: '₹ ${data.amount}',
        ),
        _buildDashboardCard(
          title: 'Created',
          value: data.createdOrders.toString(),
        ),
        _buildDashboardCard(
          title: 'Shipped',
          value: data.shippedOrders.toString(),
        ),
        _buildDashboardCard(
          title: 'Delivered',
          value: data.deliveredOrders.toString(),
        ),
        _buildDashboardCard(
          title: 'Cancelled',
          value: data.canceledOrders.toString(),
        ),
      ],
    );
  }
}
