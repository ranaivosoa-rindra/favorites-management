// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unnecessary_null_comparison, unused_local_variable, use_build_context_synchronously, avoid_print, no_leading_underscores_for_local_identifiers, unused_element, unused_field, prefer_final_fields, prefer_interpolation_to_compose_strings

import 'package:favorites_management/providers/bookmark.provider.dart';
import 'package:favorites_management/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkedProducts extends StatelessWidget {
  const BookmarkedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bookmarked = Provider.of<BookmarkProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Favorites"),
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: bookmarked.bookmarkItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
            child: Card(
              elevation: 3,
              child: Container(
                height: 150,
                width: double.infinity,
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // product name
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                bookmarked.bookmarkItems[index].title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            // Product manufacuturer and foundation data
                            Text(
                              bookmarked.bookmarkItems[index].manufacturer +
                                  " - " +
                                  bookmarked.bookmarkItems[index].founded,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),

                        // Product origin
                        Row(
                          children: [
                            Image.asset(
                              bookmarked.bookmarkItems[index].countryLogo,
                              height: 50,
                              width: 40,
                            ),
                            Text(
                              " ${bookmarked.bookmarkItems[index].age} ans  " +
                                  bookmarked.bookmarkItems[index].favorite
                                      .toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
