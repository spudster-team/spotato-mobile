import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotato/pages/home_page.dart';

import 'login_page.dart';

class OnbroadingPage extends ConsumerStatefulWidget {
  const OnbroadingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnbroadingPageState();
}

class _OnbroadingPageState extends ConsumerState<OnbroadingPage> {
  late SharedPreferences prefs;
  @override
  void initState() {
    Timer(const Duration(microseconds: 1), () async {
      final prefs = await SharedPreferences.getInstance();
      final isConnected = prefs.getBool('isConnected') ?? false;
      if (isConnected) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
