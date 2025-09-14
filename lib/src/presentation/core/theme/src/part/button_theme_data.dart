part of '../theme_data.dart';

class FilledButtonLightThemeData with ThemeExtensions {
  FilledButtonThemeData call() {
    return FilledButtonThemeData(style: _buttonStyle);
  }

  static ButtonStyle get _buttonStyle => ButtonStyle(
        elevation: WidgetStateProperty.resolveWith<double>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return 10;
            }
            if (states.contains(WidgetState.pressed)) {
              return 15;
            }
            return 5;
          },
        ),
        shadowColor: WidgetStateProperty.all(lightColor.primary.withOpacity(0.5)),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return lightColor.primary.withOpacity(0.8);
            }
            if (states.contains(WidgetState.pressed)) {
              return lightColor.primary;
            }
            return lightColor.primary.withOpacity(0.9);
          },
        ),
        shape: WidgetStateProperty.all(
          StadiumBorder(side: BorderSide(color: lightColor.primary, width: 2)),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      );

  static ButtonStyle fullWidthStyle() => _buttonStyle;

  static ButtonStyle contentSizeStyle() =>
      _buttonStyle.copyWith(minimumSize: WidgetStateProperty.all(const Size(0, 48)));
}

class ElevatedButtonLightThemeData with ThemeExtensions {
  ElevatedButtonThemeData call() {
    return ElevatedButtonThemeData(style: _buttonStyle);
  }

  static ButtonStyle get _buttonStyle => ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return lightColor.primary.withOpacity(0.1);
            }
            if (states.contains(WidgetState.pressed)) {
              return lightColor.primary.withOpacity(0.2);
            }
            return Colors.transparent;
          },
        ),
        shape: WidgetStateProperty.all(
          StadiumBorder(side: BorderSide(color: lightColor.primary, width: 2)),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );

  static ButtonStyle fullWidthStyle() => _buttonStyle;

  static ButtonStyle contentSizeStyle() =>
      _buttonStyle.copyWith(minimumSize: WidgetStateProperty.all(const Size(0, 48)));
}

class _TextButtonLightThemeData with ThemeExtensions {
  TextButtonThemeData call() {
    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(lightColor.text.secondary),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class FilledButtonDarkThemeData with ThemeExtensions {
  FilledButtonThemeData call() {
    return FilledButtonThemeData(style: _buttonStyle);
  }

  static ButtonStyle get _buttonStyle => ButtonStyle(
        elevation: WidgetStateProperty.resolveWith<double>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return 20;
            }
            if (states.contains(WidgetState.pressed)) {
              return 25;
            }
            return 15;
          },
        ),
        shadowColor: WidgetStateProperty.all(darkColor.primary.withOpacity(0.5)),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return darkColor.primary.withOpacity(0.2);
            }
            if (states.contains(WidgetState.pressed)) {
              return darkColor.primary.withOpacity(0.3);
            }
            return darkColor.primary.withOpacity(0.1);
          },
        ),
        foregroundColor: WidgetStateProperty.all(const Color(0xFFFFFFFF)),
        shape: WidgetStateProperty.all(
          StadiumBorder(side: BorderSide(color: darkColor.primary, width: 2)),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      );

  static ButtonStyle fullWidthStyle() => _buttonStyle;

  static ButtonStyle contentSizeStyle() =>
      _buttonStyle.copyWith(minimumSize: WidgetStateProperty.all(const Size(0, 48)));
}

class ElevatedButtonDarkThemeData with ThemeExtensions {
  ElevatedButtonThemeData call() {
    return ElevatedButtonThemeData(style: _buttonStyle);
  }

  static ButtonStyle get _buttonStyle => ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return darkColor.primary.withOpacity(0.1);
            }
            if (states.contains(WidgetState.pressed)) {
              return darkColor.primary.withOpacity(0.2);
            }
            return Colors.transparent;
          },
        ),
        shape: WidgetStateProperty.all(
          StadiumBorder(side: BorderSide(color: darkColor.primary, width: 2)),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );

  static ButtonStyle fullWidthStyle() => _buttonStyle;

  static ButtonStyle contentSizeStyle() =>
      _buttonStyle.copyWith(minimumSize: WidgetStateProperty.all(const Size(0, 48)));
}

class _TextButtonDarkThemeData with ThemeExtensions {
  TextButtonThemeData call() {
    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(darkColor.text.secondary),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
