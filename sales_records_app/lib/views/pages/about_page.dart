// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../shared/shared.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: tertiaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Income Today : ",
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Rp 1.000.0000,00 ",
                        style: blackTextStyle.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: (() {
                      FirebaseAuth.instance.signOut();
                    }),
                    child: Icon(
                      Icons.logout,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Container(
      //     padding: const EdgeInsets.all(10.0),
      //     color: Colors.red,
      //     child: Column(
      //       children: [
      //         ElevatedButton(
      //           onPressed: (() {
      //             FirebaseAuth.instance.signOut();
      //           }),
      //           child: const Text("Logout"),
      //         ),
      //         ElevatedButton(
      //           onPressed: (() {
      //             FirebaseAuth.instance.signOut();
      //           }),
      //           child: const Text("Logout"),
      //         ),
      //         Text(user.email!),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
