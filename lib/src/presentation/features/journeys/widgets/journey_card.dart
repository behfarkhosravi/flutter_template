import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/application_state/theme_provider.dart';
import '../../../core/theme/theme.dart';

class JourneyCard extends ConsumerWidget {
  const JourneyCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: isDarkMode
                ? Colors.white.withAlpha(25)
                : Colors.black.withAlpha(12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isDarkMode
                  ? Colors.white.withAlpha(51)
                  : Colors.black.withAlpha(25),
            ),
            boxShadow: [
              BoxShadow(
                color: isDarkMode
                    ? Colors.black.withAlpha(51)
                    : Colors.black.withAlpha(25),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.airplanemode_active,
                size: 50,
                color: context.color.icon,
              ),
              const SizedBox(height: 16),
              Text(
                'Journey ${index + 1}',
                style: context.textStyle.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
