import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotato/constants.dart';
import 'package:spotato/pages/login_page.dart';

import 'pages/onbroading_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotato',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Palette.primaryColor,
        fontFamily: 'Montserrat',
      ),
      home: const OnbroadingPage(),
    );
  }
}
