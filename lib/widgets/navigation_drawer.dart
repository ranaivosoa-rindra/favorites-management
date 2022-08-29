// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../screens/products/bookmarked_products.dart';
import '../screens/products/product_feed.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              drawerHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
}

Widget drawerHeader(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
  );
}

Widget buildMenuItems(BuildContext context) {
  return Column(
    children: [
      ListTile(
        leading: Icon(Icons.home_outlined),
        title: Text("Home"),
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ProductFeed())),
      ),
      ListTile(
        leading: Icon(Icons.favorite_border),
        title: Text("Favorites"),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const BookmarkedProducts())),
      ),
    ],
  );
}
