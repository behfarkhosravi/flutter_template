import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_template/src/presentation/core/application_state/localization_provider/localization_provider.dart';
import 'package:flutter_template/src/presentation/core/application_state/theme_provider.dart';

class GlassAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const GlassAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(0.1),
          elevation: 0,
          title: const Text('My App'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              final currentLocale = ref.read(localizationProvider);
              if (currentLocale.languageCode == 'en') {
                ref
                    .read(localizationProvider.notifier)
                    .changeLocale(const Locale('es'));
              } else {
                ref
                    .read(localizationProvider.notifier)
                    .changeLocale(const Locale('en'));
              }
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                ref.read(themeProvider.notifier).toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
