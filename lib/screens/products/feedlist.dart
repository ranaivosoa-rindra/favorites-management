// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unnecessary_null_comparison, unused_local_variable, use_build_context_synchronously, avoid_print, no_leading_underscores_for_local_identifiers, unused_element, unused_field, prefer_final_fields, prefer_interpolation_to_compose_strings

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../model/product.dart';
import '../../providers/bookmark.provider.dart';

class FeedList extends StatefulWidget {
  final int dataCount;
  final List<Product> data;
  const FeedList({Key? key, required this.dataCount, required this.data})
      : super(key: key);

  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  late List items;

  @override
  void initState() {
    super.initState();
    items = [
      {"id": 1, "isbookmarked": false},
      {"id": 2, "isbookmarked": false},
      {"id": 3, "isbookmarked": false},
      {"id": 4, "isbookmarked": false},
      {"id": 5, "isbookmarked": false},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookmarkProvider>(context, listen: false);
    return Expanded(
      child: ListView.builder(
        itemCount: widget.dataCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                // Profile image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    widget.data[index].ownerImage,
                                    width: 70,
                                    height: 70,
                                  ),
                                ),

                                // Owner name
                                Container(
                                  height: 70,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.data[index].owner,
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        widget.data[index].published,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
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
                              percent: widget.data[index].grade / 100,
                              center: Text(
                                widget.data[index].grade.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    color: Colors.green),
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
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
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        widget.data[index].title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    // Product manufacuturer and foundation data
                    Text(
                      widget.data[index].manufacturer +
                          " - " +
                          widget.data[index].founded,
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
                          widget.data[index].countryLogo,
                          height: 50,
                          width: 40,
                        ),
                        Text(
                          " ${widget.data[index].age} ans  " +
                              widget.data[index].alcoolPercents,
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
                        widget.data[index].image,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          onPressed: (items[index]["isbookmarked"] == true)
                              ? null
                              : () {
                                  Product product = Product(
                                    age: widget.data[index].age,
                                    alcoolPercents:
                                        widget.data[index].alcoolPercents,
                                    countryLogo: widget.data[index].countryLogo,
                                    founded: widget.data[index].founded,
                                    grade: widget.data[index].grade,
                                    id: widget.data[index].id,
                                    image: widget.data[index].image,
                                    manufacturer:
                                        widget.data[index].manufacturer,
                                    origin: widget.data[index].origin,
                                    owner: widget.data[index].owner,
                                    ownerImage: widget.data[index].ownerImage,
                                    published: widget.data[index].published,
                                    title: widget.data[index].title,
                                    favorite: true,
                                  );

                                  provider.addBookmarkItems(product);
                                  setState(() {
                                    items[index]["isbookmarked"] = true;
                                  });
                                },
                          icon: (items[index]["isbookmarked"] == true)
                              ? Icon(Icons.favorite)
                              : Icon(EvaIcons.heartOutline),
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
  }
}
