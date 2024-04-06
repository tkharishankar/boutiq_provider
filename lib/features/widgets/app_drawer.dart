import 'package:flutter/material.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.only(topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
      ),
      child: Container(
        color: const Color(0xFFEEF1F8),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Dashboard'),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Products'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Categories'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.menu_rounded),
              title: const Text('Orders'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
