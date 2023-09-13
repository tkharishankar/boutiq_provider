import 'package:boutiq_provider/features/dashboard/presentation/states/product_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/input_validation.dart';
import '../../../router/router.dart';
import 'product_card.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends ConsumerState<DashboardScreen>
    with InputValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 150).floor();
    crossAxisCount = crossAxisCount.clamp(1, 8);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: GoogleFonts.lato(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              bloc: context.read<ProductBloc>()..add(GetProducts()),
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, onProductList: (products) {
                  _overlayEntry?.remove();
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: kIsWeb ? crossAxisCount : 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = products[index];
                      print("product ${product.toJson()}");
                      final double price = double.parse(product.price);
                      final String imageUrl = product.imageUrls[0];
                      return ProductCard(
                        productName: product.name,
                        brandName: 'Brand XYZ',
                        price: price,
                        rating: 4.5,
                        isFavorited: false,
                        imageUrl: imageUrl,
                      );
                    },
                  );
                }, onProductListError: (message) {
                  return Center(
                    child: Text(message),
                  );
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          GoRouter.of(context).pushNamed(RouteConstants.addnewproduct);
        },
        icon: Icon(Icons.add),
        label: Text(
          'Add New',
          style: GoogleFonts.lato(),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
