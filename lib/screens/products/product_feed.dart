// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unnecessary_null_comparison, unused_local_variable, use_build_context_synchronously, avoid_print, no_leading_underscores_for_local_identifiers, unused_element, unused_field, prefer_final_fields, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:favorites_management/screens/products/feedlist.dart';
import 'package:favorites_management/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../model/product.dart';
import '../../widgets/navigation_drawer.dart';

class ProductFeed extends StatefulWidget {
  const ProductFeed({Key? key}) : super(key: key);

  @override
  State<ProductFeed> createState() => _ProductFeedState();
}

class _ProductFeedState extends State<ProductFeed> {
  final TextEditingController inputController = TextEditingController();

  // for searching
  late String query;
  List<Product> _products = [];
  List<Product> _productsDisplay = [];

  Future<List<Product>> _future = _readJsonProducts();

  static Future<List<Product>> _readJsonProducts() async {
    final jsonData =
        await rootBundle.loadString("assets/api/products_data.json");
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => Product.fromJson(e)).toList();
  }

  void searchProduct(String value) {
    query = value.toLowerCase();
    setState(() {
      _productsDisplay = _products.where((element) {
        var sTitle = element.title.toLowerCase();
        var sManufacturer = element.manufacturer.toLowerCase();
        var sAlcoolPercents = element.alcoolPercents.toLowerCase();
        return sTitle.contains(query) ||
            sManufacturer.contains(query) ||
            sAlcoolPercents.contains(query) ||
            sAlcoolPercents.contains(query);
      }).toList();
    });
  }

  @override
  void initState() {
    inputController.text = "";
    query = "";
    _readJsonProducts().then((value) {
      setState(() {
        _products.addAll(value);
        _productsDisplay = _products;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                      child: SearchBar(
                        controller: inputController,
                        onChange: searchProduct,
                        hintText: 'Nom , farbicant, %alcool',
                      ),
                    ),
                  ],
                ),
              ),

              // Feedlist
              FutureBuilder(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }

                    final data = snapshot.requireData as List<Product>;

                    if (query == "") {
                      return FeedList(dataCount: data.length, data: data);
                    } else {
                      return FeedList(
                          dataCount: _productsDisplay.length,
                          data: _productsDisplay);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
