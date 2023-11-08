import 'dart:async';

import 'package:drive_seller/src/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double value = 0.0;
  @override
  void initState() {
    super.initState();
    startProgressTimer();
  }

  void startProgressTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (value < 1.0) {
          value += 0.1;
        } else {
          timer.cancel();
          Navigator.of(context).pushNamed('/on-boarding');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: LinearProgressIndicator(
            backgroundColor: AppColors.greyLight,
            color: AppColors.primary,
            value: value,
          ),
        ),
      ),
    );
  }
}
