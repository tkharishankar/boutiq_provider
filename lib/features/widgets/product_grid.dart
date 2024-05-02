import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/responsive.dart';
import '../../router/router.dart';
import '../dashboard/domain/entities/product_resp.dart';
import '../dashboard/presentation/product_card.dart';
import '../dashboard/presentation/states/product_bloc.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // OverlayEntry? _overlayEntry;
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 150).floor();
    crossAxisCount = crossAxisCount.clamp(1, 4);
    final isMobile = Responsive.isMobile(context);
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.all(16.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                  SizedBox(height: 2.h,),
                  Text(
                    'Welcome to your dashboard',
                    style: TextStyle(fontSize: 10.sp,  color: Colors.black),
                  ),
                ],
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    // Change button color
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    // Change text color
                    elevation: MaterialStateProperty.all<double>(8.0),
                    // Change button elevation
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0), // Change button padding
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Change button border radius
                      ),
                    ),
                  ),
                  onHover: (onHover) {
                    debugPrint("onHover $onHover");
                  },
                  onPressed: () {
                    GoRouter.of(context).pushNamed(RouteConstants.addnewproduct);
                  },
                  child: Text('Add Product'))
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<ProductBloc, ProductState>(
            bloc: context.read<ProductBloc>()..add(GetProducts(providerID: '2342024PROV0662')),
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
                    return _buildGridView(products, 4);
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
