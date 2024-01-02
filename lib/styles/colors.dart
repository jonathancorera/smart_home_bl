import 'package:smart_home_bl/common_libs.dart';

class AppColors {



  final Color darkGray = Colors.black87;
  final Color offWhite = Colors.grey.shade200;
  final Color accent = Colors.greenAccent.shade700;
  
  final bool isDark = false;



  ThemeData toThemeData() {
    TextTheme txtTheme =
        (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    Color txtColor = offWhite;
    ColorScheme colorScheme = ColorScheme(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primary: accent,
      primaryContainer: accent,
      secondary: accent,
      secondaryContainer: accent,
      tertiary: accent,
      background: darkGray,
      surface: offWhite,
      onBackground: txtColor,
      onSurface: txtColor,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red.shade400,
    );


    var t =
        ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme).copyWith(
      textSelectionTheme: TextSelectionThemeData(cursorColor: accent),
      highlightColor: accent,
    );

    return t;
  }
}
