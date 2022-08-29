// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unnecessary_null_comparison, unused_local_variable, use_build_context_synchronously, avoid_print, no_leading_underscores_for_local_identifiers, unused_element, unused_field, prefer_final_fields, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:favorites_management/screens/products/feedlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../model/product.dart';
import '../../providers/bookmark.provider.dart';
import '../../widgets/navigation_drawer.dart';

class ProductFeed extends StatefulWidget {
  const ProductFeed({Key? key}) : super(key: key);

  @override
  State<ProductFeed> createState() => _ProductFeedState();
}

class _ProductFeedState extends State<ProductFeed> {
  // late List _products;
  Future<List<Product>> __future = _readJsonProducts();

  static Future<List<Product>> _readJsonProducts() async {
    final jsonData =
        await rootBundle.loadString("assets/api/products_data.json");
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => Product.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/icons/whisky.png",
        ),
        title: Text("IndexRHUM"),
      ),
      endDrawer: NavigationDrawer(),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            // Header: text + search bar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  // text
                  Text(
                    "communité".toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // search bar
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Icon(
                            Icons.search,
                            size: 19,
                          ),
                        ),
                        hintText: "ID, Distillerie, pays",
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            // Feedlist
            FutureBuilder(
                future: __future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text("Loading..."),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }

                  var products = snapshot.requireData as List<Product>;
                  final provider =
                      Provider.of<BookmarkProvider>(context, listen: false);

                  return FeedList(dataCount: products.length, data: products);
                }),
          ],
        ),
      ),
    );
  }
}
