import 'package:smart_home_bl/common_libs.dart';
import 'colors.dart';

final $styles = AppStyle();

@immutable
class AppStyle {
  final AppColors colors = AppColors();

  late final _Corners corners = _Corners();

  late final _Shadows shadows = _Shadows();

  late final _Insets insets = _Insets();


  final _Times times = _Times();

  final _TextStyles textStyles = _TextStyles();

  final _InputBorderStyles inputBorderStyles = _InputBorderStyles();


}

@immutable
class _TextStyles {
  final TextStyle loginHeaderText = GoogleFonts.poppins(
      textStyle: const TextStyle(
    color: Colors.white,
    letterSpacing: 10,
    fontSize: 24,
  ));

  final TextStyle headerText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.black,
          letterSpacing: .5,
          fontSize: 18,
          fontWeight: FontWeight.w500));

  final TextStyle subheaderText = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: Colors.grey.shade200,
    letterSpacing: .5,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ));


  final TextStyle inputFieldText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.white,
          letterSpacing: .5,
          fontSize: 14,
          fontWeight: FontWeight.w300));

  final TextStyle inputFieldLabelText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.white,
          letterSpacing: .5,
          fontSize: 14,
          fontWeight: FontWeight.w500));

  final TextStyle bodyHeader = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.black,
          letterSpacing: .5,
          fontSize: 16,
          fontWeight: FontWeight.w500));

  final TextStyle bodyText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.black,
          letterSpacing: .5,
          fontSize: 14,
          fontWeight: FontWeight.w300));

  final TextStyle listTileHeaderText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.black,
          letterSpacing: .2,
          fontSize: 14,
          fontWeight: FontWeight.w300));


  final TextStyle searchTextHint = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: Colors.grey[100],
    letterSpacing: .5,
    fontSize: 12,
  ));
  final TextStyle searchTextInput = GoogleFonts.poppins(
      textStyle: const TextStyle(
    color: Colors.white,
    letterSpacing: .5,
    fontSize: 12,
  ));

 

  final TextStyle buttonText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.black,
          letterSpacing: .5,
          fontSize: 12,
          fontWeight: FontWeight.w500));

  final TextStyle calendarFadeInText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.white,
          letterSpacing: .1,
          fontSize: 12,
          fontWeight: FontWeight.w500));


            final TextStyle fadeInText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.white,
          letterSpacing: .1,
          fontSize: 14,
          fontWeight: FontWeight.w500));

  final TextStyle cardHeaderText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400));

  final TextStyle cardTitleText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400));

  final TextStyle cardBodyText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400));

  final TextStyle cardTagText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400));

  final TextStyle carouselItemHeaderText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500));

// == == == == == == == NEW == == == == == ==

  final TextStyle dialogMainText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.black,
          letterSpacing: .5,
          fontSize: 18,
          fontWeight: FontWeight.w500));

  final TextStyle dialogSubText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.black,
          letterSpacing: .5,
          fontSize: 14,
          fontWeight: FontWeight.w400));

  final TextStyle dialogText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.black,
          letterSpacing: .5,
          fontSize: 12,
          fontWeight: FontWeight.w400));

  final TextStyle dialogListItemHeader = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.black,
          letterSpacing: .3,
          fontSize: 12,
          fontWeight: FontWeight.w400));

  final TextStyle miniButtonText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500));
}


@immutable
class _InputBorderStyles {
  final OutlineInputBorder inputTextFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.white, width: 2),
  );

  final OutlineInputBorder inputTextEnabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.cyan, width: 2),
  );

  final OutlineInputBorder inputTextErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.red, width: 2),
  );

  final OutlineInputBorder dialogInputTextFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.black),
  );
}



@immutable
class _Times {
  final Duration fast = const Duration(milliseconds: 300);
  final Duration med = const Duration(milliseconds: 600);
  final Duration slow = const Duration(milliseconds: 900);
  final Duration pageTransition = const Duration(milliseconds: 200);
}

@immutable
class _Corners {
  late final double sm = 4;
  late final double md = 8;
  late final double lg = 32;
}

@immutable
class _Insets {
  late final double xxs = 4;
  late final double xs = 8;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 48;
  late final double xxl = 56;
  late final double offset = 80;
}

@immutable
class _Shadows {
  final textSoft = [
    Shadow(
        color: Colors.black.withOpacity(.25),
        offset: const Offset(0, 2),
        blurRadius: 4),
  ];
  final text = [
    Shadow(
        color: Colors.black.withOpacity(.6),
        offset: const Offset(0, 2),
        blurRadius: 2),
  ];
  final textStrong = [
    Shadow(
        color: Colors.black.withOpacity(.6),
        offset: const Offset(0, 4),
        blurRadius: 6),
  ];
}
