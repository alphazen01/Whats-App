import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whats_app/features/login/login_screen.dart';
import 'package:whats_app/screens/inbox_screen/inbox_screen.dart';

import 'components/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            // MaterialPageRoute(builder: (context) => const InboxScreen())));
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      body: const SplashBody(),
    );
  }
}
