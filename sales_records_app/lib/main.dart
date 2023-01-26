// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sales_records_app/views/shared/shared.dart';

import 'views/pages/about_page.dart';
import 'views/pages/login_page.dart';
import 'views/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/login",
        name: "login",
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: "/",
        name: "main_page",
        builder: (context, state) {
          return const MainPage();
        },
        routes: [
          GoRoute(
            path: "about",
            name: "about",
            builder: (context, state) {
              return const AboutPage();
            },
          ),
        ],
      ),
    ],
    initialLocation: "/login",
    debugLogDiagnostics: true,
    routerNeglect: true,
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: Colors.transparent,
        // primarySwatch: Colors.cyan,
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
