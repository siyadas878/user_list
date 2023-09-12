import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:users_list/core/constants/const.dart';
import 'package:users_list/presentation/screens/home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    const lottieAnimationUrl =
        'https://lottie.host/4b78a816-a019-42bc-ac48-b1a709fbfb19/T8VrylYbhl.json';

    final lottieWidth = screenWidth >= 600 ? 400.0 : 200.0;
    final lottieHeight = screenWidth >= 600 ? 400.0 : 200.0;

    wait(context);
    return Scaffold(
      backgroundColor: tealcolor,
      body: SafeArea(
        child: Center(
          child: Lottie.network(
            lottieAnimationUrl,
            width: lottieWidth,
            height: lottieHeight,
          ),
        ),
      ),
    );
  }
}

wait(context) async {
  Timer(const Duration(seconds: 5), () {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) => const HomeScreen(),
    ));
  });
}
