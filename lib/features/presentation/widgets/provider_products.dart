import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/responsive.dart';
import '../../../router/router.dart';
import '../../data/models/product/product_resp.dart';
import '../bloc/product/product_bloc.dart';
import '../pages/product/product_card.dart';

class ProviderProduct extends StatelessWidget {
  const ProviderProduct({super.key});

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
              ..add(const GetProducts()),
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                onProductList: (products) {
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
        crossAxisCount: count,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        final String imageUrl =
            product.imageUrls.isNotEmpty ? product.imageUrls[0] : '';
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed(
              RouteConstants.addNewProduct,
              pathParameters: {'productId': product.productId},
            );
          },
          child: ProductCard(
            productName: product.name,
            brandName: product.description,
            rating: 4.5,
            isFavorited: false,
            imageUrl: imageUrl,
          ),
        );
      },
    );
  }
}
