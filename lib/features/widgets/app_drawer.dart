import 'package:flutter/material.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0)),
      ),
      child: Container(
        color: Color(0xFFEEF1F8),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Products'),
              onTap: () {
                // Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Categories'),
              onTap: () {
                //Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_rounded),
              title: Text('Orders'),
              onTap: () {
                //Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
