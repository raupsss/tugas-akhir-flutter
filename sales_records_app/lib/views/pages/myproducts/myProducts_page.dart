// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sales_records_app/models/category_data.dart';
import 'package:sales_records_app/views/pages/myproducts/categoryItem.dart';
import 'package:sales_records_app/views/pages/util/dropdown.dart';
import 'package:sales_records_app/views/shared/shared.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key});

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  // List<Widget> categoryProducts = ["Sa"]

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, Admin !",
                          style: blackTextStyle.copyWith(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "08 Feb, 2023",
                          style: blackTextStyle.copyWith(
                              fontSize: 10.0, color: tertiaryColor),
                        ),
                      ],
                    ),
                    const DropdownWidget(iconColor: Colors.white,),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Product",
                        style: blackTextStyle.copyWith(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 9,
                        ),
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryItem(
                                    title:
                                        "${CategoryData.listCategory[index]["title"]}", // VIEW MODEL
                                  ),
                                ),
                              );
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: tertiaryColor,
                              ),
                              // color: Colors.red[100],
                              child: Center(
                                child: Text(
                                  "${CategoryData.listCategory[index]["title"]}", // VIEW MODEL
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
