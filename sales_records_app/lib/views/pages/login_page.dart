// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sales_records_app/views/pages/main_page.dart';
import 'package:sales_records_app/views/shared/shared.dart';

import '../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final inputName = TextEditingController();
  final inputEmail = TextEditingController();
  final inputPassword = TextEditingController();

  @override
  void dispose() {
    inputName.dispose();
    inputEmail.dispose();
    inputPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future signIn() async {
      showDialog(
        context: context,
        builder: ((context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      );
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: inputEmail.text.trim(),
          password: inputPassword.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      // var navigatorKey;
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Scaffold(
      backgroundColor: primaryColor,
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Ada Sesuatu Yang Error"),
              );
            } else if (snapshot.hasData) {
              return MainPage();
              // return context.goNamed("main_page");
            } else {
              return SafeArea(
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
                      width:
                          MediaQuery.of(context).size.width - 2 * defaultMargin,
                      child: ElevatedButton(
                        onPressed: () {
                          // context.goNamed("main_page");
                          modalMasuk(context);
                          // showModalBottomSheet(
                          //   context: context,
                          //   isScrollControlled: true,
                          //   builder: ((context) {
                          //     return StatefulBuilder(
                          //       builder: (BuildContext context,
                          //           StateSetter setState) {
                          //         return Wrap(
                          //           children: [
                          //             Container(
                          //               color: Colors.transparent,
                          //               child: Container(
                          //                 decoration: BoxDecoration(
                          //                   color: green200,
                          //                   borderRadius: BorderRadius.only(
                          //                     topRight: Radius.circular(40),
                          //                     topLeft: Radius.circular(40),
                          //                   ),
                          //                 ),
                          //                 child: Container(
                          //                   margin: EdgeInsets.symmetric(
                          //                     horizontal: defaultMargin,
                          //                   ),
                          //                   child: Column(
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     children: [
                          //                       SizedBox(
                          //                         height: 25,
                          //                       ),
                          //                       Row(
                          //                         children: [
                          //                           Column(
                          //                             children: [
                          //                               Text(
                          //                                 "MASUK",
                          //                                 style: blackTextStyle
                          //                                     .copyWith(
                          //                                   fontSize: 30,
                          //                                   color: blackColor,
                          //                                   fontWeight:
                          //                                       FontWeight.bold,
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                           Spacer(),
                          //                           InkWell(
                          //                             onTap: () {
                          //                               Navigator.pop(context);
                          //                             },
                          //                             child: Image.asset(
                          //                               "assets/images/myPict.jpg",
                          //                               height: 30,
                          //                               width: 30,
                          //                             ),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                       SizedBox(
                          //                         height: 25,
                          //                       ),
                          //                       Form(
                          //                         key: _formKey,
                          //                         child: Column(
                          //                           children: [
                          //                             TextFormField(
                          //                               validator: (value) {
                          //                                 if (value == null ||
                          //                                     value.isEmpty) {
                          //                                   return "Name cannot be empty";
                          //                                 }
                          //                                 return null;
                          //                               },
                          //                               controller: inputEmail,
                          //                               decoration:
                          //                                   InputDecoration(
                          //                                 border:
                          //                                     OutlineInputBorder(),
                          //                                 labelText: 'Email',
                          //                               ),
                          //                             ),
                          //                             SizedBox(
                          //                               height: 10,
                          //                             ),
                          //                             TextFormField(
                          //                               validator: (value) {
                          //                                 if (value == null ||
                          //                                     value.isEmpty) {
                          //                                   return "Password cannot be empty";
                          //                                 }
                          //                                 return null;
                          //                               },
                          //                               controller:
                          //                                   inputPassword,
                          //                               decoration:
                          //                                   InputDecoration(
                          //                                 border:
                          //                                     OutlineInputBorder(),
                          //                                 labelText: 'Password',
                          //                               ),
                          //                             ),
                          //                             SizedBox(
                          //                               height: 20,
                          //                             ),
                          //                             Container(
                          //                               height: 60,
                          //                               width: MediaQuery.of(
                          //                                           context)
                          //                                       .size
                          //                                       .width -
                          //                                   2 * defaultMargin,
                          //                               child: ElevatedButton(
                          //                                 onPressed: () {
                          //                                   // context.goNamed("main_page");
                          //                                   signIn;
                          //                                   print(inputEmail
                          //                                       .text);
                          //                                   print(inputPassword
                          //                                       .text);
                          //                                 },
                          //                                 style: ElevatedButton
                          //                                     .styleFrom(
                          //                                   backgroundColor:
                          //                                       secondaryColor,
                          //                                   shape:
                          //                                       RoundedRectangleBorder(
                          //                                     borderRadius:
                          //                                         BorderRadius
                          //                                             .circular(
                          //                                                 15),
                          //                                     side: BorderSide(
                          //                                       color:
                          //                                           secondaryColor,
                          //                                       width: 3,
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //                                 child: Text(
                          //                                   "Masuk",
                          //                                   style:
                          //                                       blackTextStyle
                          //                                           .copyWith(
                          //                                     fontSize: 20,
                          //                                     fontWeight:
                          //                                         FontWeight
                          //                                             .w500,
                          //                                     color:
                          //                                         primaryColor,
                          //                                   ),
                          //                                 ),
                          //                               ),
                          //                             ),
                          //                             SizedBox(
                          //                               height: 30,
                          //                             ),
                          //                             Row(
                          //                               mainAxisAlignment:
                          //                                   MainAxisAlignment
                          //                                       .center,
                          //                               crossAxisAlignment:
                          //                                   CrossAxisAlignment
                          //                                       .center,
                          //                               children: [
                          //                                 Text(
                          //                                   "Belum punya Akun ? ",
                          //                                   style:
                          //                                       blackTextStyle
                          //                                           .copyWith(
                          //                                     fontSize: 14,
                          //                                   ),
                          //                                 ),
                          //                                 InkWell(
                          //                                   onTap: () {
                          //                                     Navigator.pop(
                          //                                         context);
                          //                                     modalDaftar(
                          //                                         context);
                          //                                   },
                          //                                   child: Text(
                          //                                     "Daftar",
                          //                                     style:
                          //                                         blackTextStyle
                          //                                             .copyWith(
                          //                                       fontSize: 14,
                          //                                       color:
                          //                                           secondaryColor,
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                             SizedBox(
                          //                               height: 20,
                          //                             ),
                          //                           ],
                          //                         ),
                          //                       )
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         );
                          //       },
                          //     );
                          //   }),
                          // );
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
                      width:
                          MediaQuery.of(context).size.width - 2 * defaultMargin,
                      child: ElevatedButton(
                        onPressed: () {
                          // context.goNamed("daftar");
                          modalDaftar(context);
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
                      style: blackTextStyle.copyWith(
                          color: secondaryColor, fontSize: 11),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }

  SafeArea loginPage(BuildContext context) {
    return SafeArea(
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
                // context.goNamed("main_page");
                modalMasuk(context);
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
                // context.goNamed("daftar");
                modalDaftar(context);
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
            style: blackTextStyle.copyWith(color: secondaryColor, fontSize: 11),
          )
        ],
      ),
    );
  }

  Future<dynamic> modalDaftar(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: ((context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Wrap(
              children: [
                Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: green200,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "DAFTAR",
                                    style: blackTextStyle.copyWith(
                                      fontSize: 30,
                                      color: blackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  "assets/images/myPict.jpg",
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Name cannot be empty";
                                    }
                                    return null;
                                  },
                                  controller: inputName,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Nama Lengkap',
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Name cannot be empty";
                                    }
                                    return null;
                                  },
                                  controller: inputName,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email',
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Name cannot be empty";
                                    }
                                    return null;
                                  },
                                  controller: inputName,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width -
                                      2 * defaultMargin,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // DAFTAR ADMIN
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: secondaryColor,
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
                                        color: primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sudah punya Akun ? ",
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        modalMasuk(context);
                                      },
                                      child: Text(
                                        "Masuk",
                                        style: blackTextStyle.copyWith(
                                          fontSize: 14,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        );
      }),
    );
  }

  Future<dynamic> modalMasuk(BuildContext context) {
    Future signIn() async {
      showDialog(
        context: context,
        builder: ((context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      );
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: inputEmail.text,
          password: inputPassword.text,
        );
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      // var navigatorKey;
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: ((context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Wrap(
              children: [
                Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: green200,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "MASUK",
                                    style: blackTextStyle.copyWith(
                                      fontSize: 30,
                                      color: blackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  "assets/images/myPict.jpg",
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Name cannot be empty";
                                    }
                                    return null;
                                  },
                                  controller: inputEmail,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email',
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Password cannot be empty";
                                    }
                                    return null;
                                  },
                                  controller: inputPassword,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width -
                                      2 * defaultMargin,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // context.goNamed("main_page");
                                      signIn;
                                      print(inputEmail.text);
                                      print(inputPassword.text);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: secondaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                          color: secondaryColor,
                                          width: 3,
                                        ),
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
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Belum punya Akun ? ",
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        modalDaftar(context);
                                      },
                                      child: Text(
                                        "Daftar",
                                        style: blackTextStyle.copyWith(
                                          fontSize: 14,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        );
      }),
    );
  }
}
