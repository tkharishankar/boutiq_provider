import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/responsive.dart';
import '../../data/models/product/product_resp.dart';
import '../bloc/product/product_bloc.dart';
import '../pages/product/product_card.dart';

class ProviderProduct extends StatelessWidget {
  const ProviderProduct({super.key});

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
                    return _buildGridView(products, 3);
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

  Widget _buildGridView(List<Product> products, int count) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count, // Adjust the number of columns as needed
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        final double price = double.parse(product.price);
        final String imageUrl = product.imageUrls[0];
        return ProductCard(
          productName: product.name,
          brandName: product.description,
          price: price,
          rating: 4.5,
          isFavorited: false,
          imageUrl: imageUrl,
        );
      },
    );
  }
}
