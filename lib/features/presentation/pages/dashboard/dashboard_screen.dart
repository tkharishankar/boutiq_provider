import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_texts.dart';
import '../../../../core/utils/input_validation.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/utils/size.dart';
import '../../../../router/router.dart';
import '../../widgets/app_dialog.dart';
import '../../widgets/dashboard_detail.dart';
import '../../widgets/delivery_charge.dart';
import '../../widgets/provider_account.dart';
import '../../widgets/provider_orders.dart';
import '../../widgets/provider_products.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends ConsumerState<DashboardScreen>
    with InputValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  final int _debouncetime = 1000;

  String? _selectedMenuItem;

  @override
  void initState() {
    super.initState();
    // Set the initial selected menu item
    _selectedMenuItem = 'Dashboard';
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppTexts.boutiqTitle,
            style: Config.h2(context).copyWith(
              fontSize: 24,
            )),
      ),
      body: _MainPage(
          isMobile: isMobile,
          selectedMenuItem: _selectedMenuItem,
          onMenuItemSelected: (menuItem) {
            setState(() {
              _selectedMenuItem = menuItem;
            });
          }),
      drawer: isMobile
          ? DrawerWidget(onMenuItemSelected: (menuItem) {
              setState(() {
                _selectedMenuItem = menuItem;
              });
              Navigator.pop(context);
            })
          : null,
    );
  }
}

class _MainPage extends StatelessWidget {
  final bool? isMobile;
  final String? selectedMenuItem;
  final void Function(String)? onMenuItemSelected;

  const _MainPage({
    this.isMobile,
    this.selectedMenuItem,
    this.onMenuItemSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget contentWidget;
    switch (selectedMenuItem) {
      case 'Account':
        contentWidget = AccountDetail();
        break;
      case 'Dashboard':
        contentWidget = const DashboardDetail();
        break;
      case 'Products':
        contentWidget = const ProviderProduct();
        break;
      case 'Delivery Charges':
        contentWidget = DeliveryChargeView();
        break;
        case 'Orders':
        contentWidget = const ProviderOrder();
        break;
      default:
        contentWidget = const DashboardDetail();
        break;
    }

    return Container(
      child: isMobile!
          ? contentWidget
          : Row(
              children: [
                DrawerWidget(onMenuItemSelected: onMenuItemSelected),
                Expanded(child: contentWidget),
              ],
            ),
    );
  }
}

class DrawerWidget extends StatefulWidget {
  final void Function(String)? onMenuItemSelected;

  const DrawerWidget({Key? key, this.onMenuItemSelected}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String? _selectedMenuItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            _buildMenuItem(
              Icons.dashboard,
              'Dashboard',
            ),
            _buildMenuItem(
              Icons.manage_accounts,
              'Account',
            ),
            _buildMenuItem(Icons.add_box_rounded, 'Add Product', onTap: () {
              GoRouter.of(context).pushNamed(
                RouteConstants.addNewProduct,
                pathParameters: {'productId': "XXX"},
              );
            }),
            _buildMenuItem(
              Icons.production_quantity_limits,
              'Products',
            ),
            _buildMenuItem(
              Icons.monetization_on,
              'Delivery Charges',
            ),
            _buildMenuItem(
              Icons.local_shipping,
              'Orders',
            ),
            _buildMenuItem(
              Icons.logout,
              'Logout',
              onTap: () {
                showCustomDialog(
                  context,
                  'Logout',
                  'Are you sure you want to logout?',
                  () {
                    GoRouter.of(context).pushNamed(RouteConstants.login);
                  },
                  confirmText: 'Logout',
                  cancelText: 'Cancel',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {VoidCallback? onTap}) {
    final isSelected = title == _selectedMenuItem;
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blue : null),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blue : null,
          fontWeight: isSelected ? FontWeight.bold : null,
        ),
      ),
      onTap: () {
        setState(() {
          _selectedMenuItem = title;
        });
        widget.onMenuItemSelected?.call(title);
        onTap?.call();
      },
    );
  }
}
