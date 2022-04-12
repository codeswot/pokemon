import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/core/d_injector.dart';

void main() {
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationService = di.navigationServices;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: navigationService.router.routeInformationParser,
      routerDelegate: navigationService.router.routerDelegate,
    );
  }
}
