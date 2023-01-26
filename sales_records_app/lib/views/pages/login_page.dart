// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sales_records_app/views/shared/shared.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            Image.asset(
              "assets/images/myPict.jpg",
              height: 333,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Selamat Datang",
              style: secondaryTextStyle,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Lorem ipsum dolor sit amet, \kadhakd consequat, \hadgjadhgahdah.",
              style: blackTextStyle.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: ElevatedButton(
                onPressed: () {
                  context.goNamed("main_page");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Masuk",
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: ElevatedButton(
                onPressed: () {
                  context.goNamed("daftar");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      color: secondaryColor,
                      width: 3,
                    ),
                  ),
                ),
                child: Text(
                  "Daftar",
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "All Right Reserved @2023 by Ghani",
              textAlign: TextAlign.center,
              style:
                  blackTextStyle.copyWith(color: secondaryColor, fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
