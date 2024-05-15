import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/responsive.dart';
import '../../data/models/product/product_resp.dart';
import '../bloc/product/product_bloc.dart';

class DashboardDetail extends StatelessWidget {
  const DashboardDetail({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 150).floor();
    crossAxisCount = crossAxisCount.clamp(1, 4);
    final isMobile = Responsive.isMobile(context);
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ProductBloc, ProductState>(
            bloc: context.read<ProductBloc>()
              ..add(const GetProducts(providerID: '2342024PROV0662')),
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                onProductList: (products) {
                  // _overlayEntry?.remove();
                  if (isMobile) {
                    return _buildGridView(products, 2);
                  } else {
                    return _buildGridView(products, 6);
                  }
                },
                onProductListError: (message) {
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

  Widget _buildGridView(List<Product> products, int i) {
    return GridView.count(
      crossAxisCount: i,
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildDashboardCard(
          title: 'Total Orders',
          value: '200',
        ),
        _buildDashboardCard(
          title: 'Total Amount',
          value: '\$5000',
        ),
        _buildDashboardCard(
          title: 'Created',
          value: '150',
        ),
        _buildDashboardCard(
          title: 'Shipped',
          value: '120',
        ),
        _buildDashboardCard(
          title: 'Delivered',
          value: '100',
        ),
        _buildDashboardCard(
          title: 'Cancelled',
          value: '20',
        ),
      ],
    );
  }
}
