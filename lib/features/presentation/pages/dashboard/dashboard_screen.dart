import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/input_validation.dart';
import '../../../../core/utils/responsive.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/product_grid.dart';
import '../../../data/models/product/product_resp.dart';
import '../product/product_card.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> with InputValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  final int _debouncetime = 1000;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: isMobile
            ? null
            : Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 70.w),
                    height: 30.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextFormField(
                      cursorWidth: 1.5,
                      cursorHeight: 12.0.h,
                      controller: _searchController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        isCollapsed: true,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                        border: InputBorder.none,
                        suffixIcon: (_searchController.text.isEmpty)
                            ? IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  FocusScope.of(context).requestFocus(FocusNode());
                                },
                              )
                            : IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  FocusScope.of(context).requestFocus(FocusNode());
                                },
                              ),
                      ),
                      onChanged: (value) {
                        if (_debounce?.isActive ?? false) _debounce?.cancel();
                        _debounce = Timer(Duration(milliseconds: _debouncetime), () {
                          debugPrint(_searchController.text);
                        });
                      },
                    ),
                  ),
                ],
              ),
        actions: [
          if(isMobile)
            IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'search',
                onPressed: () {
                  // handle the press
                }),
          IconButton(
              icon: const Icon(Icons.notifications),
              tooltip: 'Notifications',
              onPressed: () {
                // handle the press
              }),
          IconButton(
              icon: const Icon(Icons.account_box_rounded),
              tooltip: 'Profile',
              onPressed: () {
                // handle the press
              }),
        ],
        // title:,
      ),
      body: _MainPage(isMobile),
      // floatingActionButton: _buildAddNewProductButton(context),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: isMobile ? const AppDrawerWidget() : null,
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildListView(List<Product> products) {
    return ListView.separated(
      itemCount: products.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10.0); // Adjust the height as needed
      },
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
  }

//
// Widget _buildListView(List<Product> products) {
//   return ListView.builder(
//     itemCount: products.length,
//     itemBuilder: (BuildContext context, int index) {
//       final product = products[index];
//       final double price = double.parse(product.price);
//       final String imageUrl = product.imageUrls[0];
//       return ProductCard(
//         productName: product.name,
//         brandName: 'Brand XYZ',
//         price: price,
//         rating: 4.5,
//         isFavorited: false,
//         imageUrl: imageUrl,
//       );
//     },
//   );
// }
}

class _MainPage extends StatelessWidget {
  final bool? isMobile;

  const _MainPage(this.isMobile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFDFEDF7),
      child: isMobile!
          ? const ProductGrid()
          : const Row(
              children: [
                _DesktopMenuItems(),
                Expanded(child: ProductGrid()),
              ],
            ),
    );
  }
}

class _DesktopMenuItems extends StatelessWidget {
  const _DesktopMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 75.w, child: const AppDrawerWidget());
  }
}
