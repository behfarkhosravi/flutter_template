import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_template/src/presentation/core/application_state/localization_provider/localization_provider.dart';
import 'package:flutter_template/src/presentation/core/application_state/theme_provider.dart';
import 'package:flutter_template/src/presentation/core/theme/theme.dart';

import 'package:country_flags/country_flags.dart';

class GlassAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const GlassAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    final currentLocale = ref.watch(localizationProvider);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(0.1),
          elevation: 0,
          title: const Text('My App'),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              iconSize: 40,
              onPressed: () {
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
              icon: CountryFlag.fromLanguageCode(
                currentLocale.languageCode == 'en'
                    ? 'us'
                    : currentLocale.languageCode,
                height: 48,
                width: 32,
                borderRadius: 8,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                iconSize: 28,
                icon: Icon(
                  isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
                  color: isDarkMode ? context.color.moonIcon : context.color.sunIcon,
                ),
                onPressed: () {
                  ref.read(themeProvider.notifier).toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
