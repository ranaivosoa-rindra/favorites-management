// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unnecessary_null_comparison, unused_local_variable, use_build_context_synchronously, avoid_print, no_leading_underscores_for_local_identifiers, unused_element, unused_field, prefer_final_fields, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../model/product.dart';

class ProductFeed extends StatefulWidget {
  const ProductFeed({Key? key}) : super(key: key);

  @override
  State<ProductFeed> createState() => _ProductFeedState();
}

class _ProductFeedState extends State<ProductFeed> {
  // late List _products;
  Future<List<Product>> __future = _readJsonProducts();

  @override
  void initState() {
    super.initState();
    // _products = [];
    // _getProducts();
  }

  Future<void> _getProducts() async {
    final String jsonData =
        await rootBundle.loadString("assets/api/products_data.json");

    final data = await json.decode(jsonData);
    setState(() {
      // _products = data["products"];
    });
  }

  static Future<List<Product>> _readJsonProducts() async {
    final jsonData =
        await rootBundle.loadString("assets/api/products_data.json");
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => Product.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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

                return Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5),
                        child: Card(
                          elevation: 2,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 1.65,
                            padding: EdgeInsets.all(17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // head
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            // Profile image
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                products[index].ownerImage!,
                                                width: 70,
                                                height: 70,
                                              ),
                                            ),

                                            // Owner name
                                            Container(
                                              height: 70,
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    products[index].owner!,
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Text(
                                                    products[index].published!,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // grade
                                      SizedBox(
                                        child: CircularPercentIndicator(
                                          radius: 35.0,
                                          animation: true,
                                          animationDuration: 1200,
                                          lineWidth: 7.0,
                                          percent: products[index].grade! / 100,
                                          center: Text(
                                            products[index].grade.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30.0,
                                                color: Colors.green),
                                          ),
                                          circularStrokeCap:
                                              CircularStrokeCap.butt,
                                          backgroundColor: Color(0xffcbc9c7),
                                          progressColor: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                /// about products

                                // product name
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    products[index].title!,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),

                                // Product manufacuturer and foundation data
                                Text(
                                  products[index].manufacturer! +
                                      " - " +
                                      products[index].founded!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),

                                // Product origin
                                Row(
                                  children: [
                                    Image.asset(
                                      products[index].countryLogo!,
                                      height: 50,
                                      width: 40,
                                    ),
                                    Text(
                                      " ${products[index].age!} ans  " +
                                          products[index].alcoolPercents!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    )
                                  ],
                                ),

                                // Product image
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    products[index].image!,
                                    width: 250,
                                    height: 200,
                                  ),
                                ),

                                // heart
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(EvaIcons.heart, color: Colors.pink),
                                    Text("142")
                                  ],
                                ),

                                Divider(
                                  height: 8,
                                  thickness: 0.75,
                                  indent: 20,
                                  endIndent: 0,
                                  color: Colors.black.withOpacity(0.2),
                                ),

                                // bottom icons
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      iconSize: 28,
                                      splashRadius: 30,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.share,
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 0.5,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    IconButton(
                                      iconSize: 30,
                                      splashRadius: 20,
                                      onPressed: () {},
                                      icon: Icon(EvaIcons.heartOutline),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
