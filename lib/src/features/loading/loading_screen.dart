import 'dart:developer';

import 'package:drive_seller/src/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final value = ref.watch(progressNotifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(
            backgroundColor: AppColors.greyLight,
            color: AppColors.primary,
            value: value,
          ),
          Text("Progress: ${(value).toStringAsFixed(0)}%"),
        ],
      ),
    );
  }
}

// final progressNotifier = StateProvider<double>((ref) => 0.0);
final progressNotifier = StateNotifierProvider<ProgressNotifier, double>(
  (ref) => ProgressNotifier(),
);

class ProgressNotifier extends StateNotifier<double> {
  ProgressNotifier() : super(0);

  updateProgress() {
    if (state < 1) {
      state = state += 0.1;
      if (state >= 1.0) {
        log('done');
      }
    }
  }
}
