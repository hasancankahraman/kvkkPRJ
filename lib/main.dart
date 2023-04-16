// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/about_scrren.dart';
import 'screens/chart_screen.dart';

import 'screens/date_time_screen.dart';
import 'screens/error_scrren.dart';
import 'screens/home_screen.dart';
import 'screens/news_screen.dart';
import 'screens/products_screen.dart';
import 'screens/users_screen.dart';

void main() {
  runApp(const MyApp());
}

final _routes = GoRouter(
  initialLocation: '/home',
  errorBuilder: (context, state) => ErrorScreen(),
  routes: [
    GoRoute(
      path: '/error',
      builder: (context, state) => ErrorScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => AboutScreen(),
    ),
    GoRoute(
      path: '/users',
      builder: (context, state) => UsersScreen(),
    ),
    GoRoute(
      path: '/news',
      builder: (context, state) => NewsScreen(),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => ProductsScreen(),
    ),
    GoRoute(
      path: '/data',
      builder: (context, state) => ChartScreen(),
    ),
    GoRoute(
      path: '/datetime',
      builder: (context, state) => DateTimeScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routes,
      debugShowCheckedModeBanner: false,
      title: 'Veri İhlali Bildir',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
