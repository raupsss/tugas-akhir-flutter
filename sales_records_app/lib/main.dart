// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sales_records_app/views/shared/shared.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'views/pages/about_page.dart';
import 'views/pages/login_page.dart';
import 'views/pages/main_page.dart';
// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/login",
        name: "login",
        builder: (context, state) {
          return LoginPage();
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

  // var navigatorKey;

  MyApp({super.key});

  // get navigatorKey => null;

  @override
  Widget build(BuildContext context) {
    // var navigatorKey;
    return MaterialApp.router(
      key: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: Colors.transparent,
        // primarySwatch: Colors.transparent,
        // brightness: Brightness.dark,
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
