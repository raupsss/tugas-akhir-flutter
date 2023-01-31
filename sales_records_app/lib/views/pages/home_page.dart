// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:sales_records_app/views/pages/myProducts_page.dart';
import 'package:sales_records_app/views/shared/shared.dart';
import 'package:sales_records_app/views/util/history_tile.dart';
import 'package:calendar_appbar/calendar_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<Widget> _children = [
  //   MainScreen(),
  //   MyProductsPage(),
  // ];

  // int currentIndex = 0;

  // void onTapped(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: CalendarAppBar(
        padding: 0.0,
        backButton: false,
        accent: primaryColor,
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(const Duration(days: 140)),
        lastDate: DateTime.now(),
      ),
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: (() {}),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.pending_actions),
          ),
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.list),
          ),
        ],
      )),
      body: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // height: 500,
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    // margin: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.monetization_on,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Income : ",
                                      style: blackTextStyle.copyWith(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Rp 1.000.000,00 ",
                                      style: blackTextStyle.copyWith(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: (() {
                            FirebaseAuth.instance.signOut();
                          }),
                          child: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: secondaryColor,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "History",
                  style: blackTextStyle.copyWith(
                    fontSize: 20.0,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // return DropdownButton(items: , onChanged: onChanged)
                  },
                  child: Icon(Icons.more_horiz),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: const [
                  HistoryTile(
                    nameProduct: 'Bayam',
                    purchaseTime: '01:22',
                    quantity: 10,
                    price: 2000,
                  ),
                  HistoryTile(
                    nameProduct: 'Wortel',
                    purchaseTime: '04:29',
                    quantity: 100,
                    price: 99000,
                  ),
                  HistoryTile(
                    nameProduct: 'Apel',
                    purchaseTime: '05:22',
                    quantity: 110,
                    price: 20010,
                  ),
                  HistoryTile(
                    nameProduct: 'Kangkung',
                    purchaseTime: '12:12',
                    quantity: 10,
                    price: 2000,
                  ),
                  HistoryTile(
                    nameProduct: 'Melon',
                    purchaseTime: '16:29',
                    quantity: 10,
                    price: 2000,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
